class AddStatusToGroups < ActiveRecord::Migration[6.0]
  def change
    change_table :groups do |t|
        t.string :status, { null: false, default: 'holding' }
      end
  end

  def down
    remove_column(:groups, :status)
  end
end
