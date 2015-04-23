class CreateAppraisalQuestions < ActiveRecord::Migration
  def change
    create_table :appraisal_questions do |t|
      t.string :content
      t.belongs_to :appraisal, index: true
    end
  end
end
