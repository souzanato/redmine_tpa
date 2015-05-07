class Appraisal < ActiveRecord::Base
  unloadable
  has_paper_trail
  validates_presence_of :name, :author_id, if: lambda {|a| a.template}
  validates_inclusion_of :template, :in => [true, false]
  validates_presence_of :start_date, unless: lambda { |a| a.template }
  validates_presence_of :appraisal_id, unless: lambda { |a| a.template }
  validates_uniqueness_of :name, allow_nil: true
  attr_accessible :name, :description, :start_date, :end_date, :template, :appraisal_questions_attributes, :appraisal_template_id, :appraisee_ids, :appraisal_id, :appraiser_ids, :author_id, :appraiser_note

  has_many :appraisal_questions, dependent: :destroy
  accepts_nested_attributes_for :appraisal_questions, allow_destroy: true

  has_many :appraisees, through: :appraisal_appraisees, source: :user
  has_many :appraisal_appraisees, dependent: :destroy

  has_many :appraisers, through: :appraisal_appraisers, source: :user
  has_many :appraisal_appraisers, dependent: :destroy

  belongs_to :appraisal
  has_many :appraisals, dependent: :restrict_with_exception

  has_many :tpa_tags, dependent: :restrict_with_exception

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  # def appraisee_ids=(val)
  #   val.first.split(',').collect {|v| v.to_i}
  # end

  def template_name_and_appraisers
    unless self.template
      "#{self.appraisal.name} - #{self.appraisers.map{|a| a.name}.join(',')}"
    end
  end

  def author_and_first_60_name_words
    "#{self.author.login} - #{self.author.name}: #{self.first_60_name_words}"
  end

  def first_60_name_words
    self.name.length > 60 ? "#{self.name[0..60]}..." : self.name
  end

  validate :end_date_validation, if: lambda {|a| a.end_date.present? }
  def end_date_validation
    errors.add(:end_date, I18n.t('appraisal_end_dat_must_be_after_start_date')) unless self.end_date > self.start_date
  end

  validate :at_least_one_question, if: lambda {|a| a.template}
  def at_least_one_question
  	errors.add(:appraisal_questions, I18n.t('insert_at_least_one_appraisal_question')) unless self.appraisal_questions.any?
  end

  validate :at_least_one_appraisal_appraiser, unless: lambda {|a| a.template}
  def at_least_one_appraisal_appraiser
    errors.add(:appraiser_ids, I18n.t('insert_at_least_one_appraisal_appraiser')) unless self.appraisers.any?
  end

  validate :at_least_one_appraisal_appraisee, unless: lambda {|a| a.template}
  def at_least_one_appraisal_appraisee
    errors.add(:appraisee_ids, I18n.t('insert_at_least_one_appraisal_appraisee')) unless self.appraisees.any?
  end

  def in_progress?
    return true if self.end_date.nil?
    Date.today <= self.end_date
  end

  def any_in_progress?
    Appraisal
    .where(appraisal_id: self.appraisal_id)
    .where('? <= appraisals.end_date or appraisals.end_date is null', Date.today
    .strftime('%Y-%m-%d'))
    .any?
  end

  def self.any_in_progress(appraisal_id)
    Appraisal
    .where(appraisal_id: appraisal_id)
    .where('? <= appraisals.end_date or appraisals.end_date is null', Date.today
    .strftime('%Y-%m-%d'))
    .any?
  end

  # https://rails.lighthouseapp.com/projects/8994/tickets/2160-nested_attributes-validates_uniqueness_of-fails#ticket-2160-11
  validate :validate_unique_appraisal_questions
  def validate_unique_appraisal_questions
     validate_uniqueness_of_in_memory(
      appraisal_questions, [:content, :appraisal_id])
  end

  validate do |project|
    project.appraisal_questions.each do |appraisal_question|
      next if appraisal_question.valid?
      appraisal_question.errors.each do |key, value|
        errors.add(:base, "#{value}")
      end
    end
  end
end

module ActiveRecord
  class Base
    # Validate that the the objects in +collection+ are unique
    # when compared against all their non-blank +attrs+. If not
    # add +message+ to the base errors.
    def validate_uniqueness_of_in_memory(collection, attrs, message = nil)
      hashes = collection.inject({}) do |hash, record|
        key = attrs.map {|a| record.send(a).to_s }.join
        if key.blank? || record.marked_for_destruction?
          key = record.object_id
        end
        hash[key] = record unless hash[key]
        hash
      end
      if collection.length > hashes.length
        message ||= I18n.t('duplicate_appraisal_questions', question: collection.first.content)
        self.errors.add(:nested_base, message)
      end
    end
  end
end
