class RemoveHashIdFromAccount < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :hash_id, :string
  end
end
