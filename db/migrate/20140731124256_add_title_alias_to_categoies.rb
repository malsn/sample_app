class AddTitleAliasToCategoies < ActiveRecord::Migration
  def change
	add_column :categories, :title_alias, :string
	add_index :categories, :title_alias
  end
end
