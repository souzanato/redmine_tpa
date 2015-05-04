class AppraisalQuestionOption < ActiveRecord::Base
  unloadable
  has_paper_trail
  attr_accessible :content
  belongs_to :appraisal_question
  validates_presence_of :content
  validates_uniqueness_of :content, scope: [:appraisal_question_id]

  has_many :tpa_tags, dependent: :restrict_with_exception
end
