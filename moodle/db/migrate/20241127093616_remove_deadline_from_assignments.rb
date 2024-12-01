class RemoveDeadlineFromAssignments < ActiveRecord::Migration[7.2]
  def change
    remove_column :assignments, :deadline, :time
  end
end
