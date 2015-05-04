class AddTransactionIdColumnToPtVersions < ActiveRecord::Migration
  def self.up
    add_column :pt_versions, :transaction_id, :integer
    add_index :pt_versions, [:transaction_id]
  end

  def self.down
    remove_index :pt_versions, [:transaction_id]
    remove_column :pt_versions, :transaction_id
  end
end
