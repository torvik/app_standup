class CreateTaskMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :task_memberships do |t|
      t.references :task, foreign_key: true
      t.references :standup, foreign_key: true
    end
  end
end
