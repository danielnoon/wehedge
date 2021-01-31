class CreatePickStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :pick_stocks do |t|
      t.integer :shares
      t.references :pick, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :pick_stocks
  end
end
