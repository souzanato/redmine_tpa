class CreateAppraisalAppraisees < ActiveRecord::Migration
  def change
    create_table :appraisal_appraisees do |t|
      t.belongs_to :user, index: true
      t.belongs_to :appraisal, index: true
    end
  end
end
