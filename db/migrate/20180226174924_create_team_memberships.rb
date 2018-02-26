class CreateTeamMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :team_memberships do |t|
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
