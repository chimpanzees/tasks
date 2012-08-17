class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :text
      t.integer :user_id, :project_id, :completed_by
      t.datetime :due_on, :due_by, :completed_at
      t.timestamps
    end
  end
end
