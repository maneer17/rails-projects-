class CreateAssignments < ActiveRecord::Migration[7.2]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :content
      t.date :deadline
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
