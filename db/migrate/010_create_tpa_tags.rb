class CreateTpaTags < ActiveRecord::Migration
  def change
    create_table :tpa_tags do |t|
      t.belongs_to :appraisal, index: true
      t.belongs_to :appraisal_question_option, index: true
      t.belongs_to :user, index: true
    end
  end
end
