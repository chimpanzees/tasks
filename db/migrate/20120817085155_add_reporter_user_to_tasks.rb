class AddReporterUserToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :reported_by, :integer
  end
end