class AddSymbolTypeToPickStocks < ActiveRecord::Migration[6.0]
  def change
    change_table :pick_stocks do |t|
      t.string :category
      t.string :symbol
    end
  end

  def down
    remove_columns(:pick_stocks, :type, :category)
  end
end
