class AddGroupIdToContents < ActiveRecord::Migration
  def change
	add_column :contents, :group_id, :integer
  end
end
