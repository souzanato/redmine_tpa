class CreateAppraisals < ActiveRecord::Migration
  def change
    create_table :appraisals do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :template
      t.belongs_to :appraisal, index: true
      t.integer :author_id
      t.text :appraiser_note
    end
  end
end
