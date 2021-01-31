class CreateGroups < ActiveRecord::Migration[6.0]
  def up
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.integer :total_money
      t.integer :total_invested

      t.timestamps
    end
  end

  def down
    drop_table :groups
  end
end
