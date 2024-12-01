class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :nickname
      t.string :title

      t.timestamps
    end

    add_index :categories, :nickname, unique: true
  end
end
