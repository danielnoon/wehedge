class AddApiIdToPicksTable < ActiveRecord::Migration[6.0]
  def change
    change_table :pick_stocks do |t|
      t.string :api_id
    end
  end
end
