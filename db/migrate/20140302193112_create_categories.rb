class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.integer :parent_id
      t.text :title
      t.text :text

      t.timestamps
    end
  end
end
