class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :user_id
	  t.string :title
      t.text :text

      t.timestamps
    end
  end
end
