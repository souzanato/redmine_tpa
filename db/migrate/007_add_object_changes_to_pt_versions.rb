class AddObjectChangesToPtVersions < ActiveRecord::Migration
  def change
    add_column :pt_versions, :object_changes, :text
  end
end
