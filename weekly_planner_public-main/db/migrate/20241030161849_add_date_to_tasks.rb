class AddDateToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :date, :date
  end
end
