class AddDescriptionToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :description, :text
  end
end
