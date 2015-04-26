class CreateAppraisalParticipants < ActiveRecord::Migration
  def change
    create_table :appraisal_participants do |t|
      t.belongs_to :user, index: true
      t.belongs_to :appraisal, index: true
    end
  end
end
