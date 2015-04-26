class AppraisalQuestion < ActiveRecord::Base
  unloadable
  belongs_to :appraisal
  attr_accessible :content, :appraisal_question_options_attributes
  validates_presence_of :content

  has_many :appraisal_question_options, dependent: :destroy
  accepts_nested_attributes_for :appraisal_question_options, allow_destroy: true

  validate :at_least_one_option
  def at_least_one_option
  	errors.add(:appraisal_question_options, I18n.t('insert_at_least_one_appraisal_question_option')) unless self.appraisal_question_options.any?
  end

  # https://rails.lighthouseapp.com/projects/8994/tickets/2160-nested_attributes-validates_uniqueness_of-fails#ticket-2160-11
  validate :validate_unique_appraisal_questions
  def validate_unique_appraisal_questions
     validate_uniqueness_of_in_memory(
      appraisal_question_options, [:content, :appraisal_question_id])
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
        message ||= I18n.t('duplicate_appraisal_question_options', question: collection.first.appraisal_question.content, option: collection.first.content)
        self.errors.add(:base, message)
      end
    end
  end
end
