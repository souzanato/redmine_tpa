class AppraisalQuestion < ActiveRecord::Base
  unloadable
  belongs_to :appraisal
  attr_accessible :content, :appraisal_question_options_attributes

  has_many :appraisal_question_options, dependent: :restrict_with_exception
  accepts_nested_attributes_for :appraisal_question_options, allow_destroy: true
end
