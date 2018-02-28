class RemoveHasIdFromAccount < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :has_id, :string
  end
end
