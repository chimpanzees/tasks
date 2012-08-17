class DontNeedTheDueByField < ActiveRecord::Migration
  def up
    remove_column :tasks, :due_by
  end

  def down
    add_column :tasks, :due_by, :datetime
  end
end