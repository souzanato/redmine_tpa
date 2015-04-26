class Appraisal < ActiveRecord::Base
  unloadable
  validates_presence_of :name, :template
  validates_uniqueness_of :name
  attr_accessible :name, :description, :template, :appraisal_questions_attributes

  has_many :appraisal_questions, dependent: :destroy
  accepts_nested_attributes_for :appraisal_questions, allow_destroy: true

  validate :at_least_one_question
  def at_least_one_question
  	errors.add(:appraisal_questions, I18n.t('insert_at_least_one_appraisal_question')) unless self.appraisal_questions.any?
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
        self.errors.add(:base, message)
      end
    end
  end
end
