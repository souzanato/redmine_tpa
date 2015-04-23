class CreateAppraisalQuestionOptions < ActiveRecord::Migration
  def change
    create_table :appraisal_question_options do |t|
      t.string :content
      t.belongs_to :appraisal_question, index: true
    end
  end
end
