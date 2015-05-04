class AppraisalAppraisee < ActiveRecord::Base
  unloadable
  has_paper_trail
  belongs_to :user
  belongs_to :appraisal
end
