class AddDeadlineToAssignments < ActiveRecord::Migration[7.2]
  def change
    add_column :assignments, :deadline, :datetime
  end
end
