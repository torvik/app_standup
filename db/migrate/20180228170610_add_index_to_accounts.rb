class AddIndexToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :hash_id, :string
    add_index :accounts, :hash_id
  end
end
