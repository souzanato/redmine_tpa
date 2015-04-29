class AddAppraisalIdToAppraisals < ActiveRecord::Migration
  def change
    add_column :appraisals, :appraisal_id, :integer
  end
end