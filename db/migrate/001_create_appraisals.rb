class CreateAppraisals < ActiveRecord::Migration
  def change
    create_table :appraisals do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :template
    end
  end
end
