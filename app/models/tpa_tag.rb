class TpaTag < ActiveRecord::Base
  unloadable
  has_paper_trail
  belongs_to :appraisal
  belongs_to :appraisal_question_option
  belongs_to :appraisee, class_name: 'User', foreign_key: 'user_id'
  belongs_to :issue
  attr_accessible :appraisal_id, :appraisal_question_option_id, :user_id, :issue_id
end
