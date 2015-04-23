class CreateAppraisals < ActiveRecord::Migration
  def change
    create_table :appraisals do |t|
      t.string :name
      t.text :description
      t.boolean :template
    end
  end
end
