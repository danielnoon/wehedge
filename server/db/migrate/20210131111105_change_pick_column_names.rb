class ChangePickColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :picks, :groups_id, :group_id
    rename_column :picks, :users_id, :user_id
  end

  def down
    rename_column :picks, :group_id, :groups_id
    rename_column :picks, :user_id, :users_id
  end
end
