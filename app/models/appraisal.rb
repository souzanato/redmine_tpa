class Appraisal < ActiveRecord::Base
  unloadable
  validates_presence_of :name, :template
  validates_presence_of :start_date, unless: lambda { |a| a.template }
  validates_uniqueness_of :name
  attr_accessible :name, :description, :start_date, :end_date, :template, :appraisal_questions_attributes, :appraisal_template_id
  attr_accessor :appraisal_template_id

  has_many :appraisal_questions, dependent: :destroy
  accepts_nested_attributes_for :appraisal_questions, allow_destroy: true

  has_many :participants, foreign_key: 'user_id', through: :appraisal_participants
  has_many :appraisal_participants, dependent: :destroy

  validate :end_date_validation, if: lambda {|a| a.end_date.present? }
  def end_date_validation
    errors.add(:end_date, I18n.t('appraisal_end_dat_must_be_after_start_date')) unless self.end_date > self.start_date
  end

  validate :at_least_one_question
  def at_least_one_question
  	errors.add(:appraisal_questions, I18n.t('insert_at_least_one_appraisal_question')) unless self.appraisal_questions.any?
  end

  validate :appraisal_template_id_presence
  def appraisal_template_id_presence
    errors.add(:appraisal_template_id, I18n.t('activerecord.errors.messages.empty')) if (self.template == false and self.appraisal_template_id.blank?)
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
