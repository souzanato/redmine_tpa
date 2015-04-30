class AppraisalAppraiser < ActiveRecord::Base
  unloadable
  belongs_to :user
  belongs_to :appraisal
end
