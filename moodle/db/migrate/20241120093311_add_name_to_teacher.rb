class AddNameToTeacher < ActiveRecord::Migration[7.2]
  def change
    add_column :teachers, :name, :string
  end
end
