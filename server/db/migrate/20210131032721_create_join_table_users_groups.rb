class CreateJoinTableUsersGroups < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :groups do |t|
      # t.index [:user_id, :group_id]
      # t.index [:group_id, :user_id]
      t.integer :contribution
    end
  end

  def down
    drop_table :users_groups
  end
end
