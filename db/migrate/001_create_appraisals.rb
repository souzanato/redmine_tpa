class CreateAppraisals < ActiveRecord::Migration
  def change
    create_table :appraisals do |t|
      t.string :name
      t.text :description
      t.boolean :template
      t.belongs_to :project, index: true
    end
  end
end
