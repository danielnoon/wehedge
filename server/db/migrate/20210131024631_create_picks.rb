class CreatePicks < ActiveRecord::Migration[6.0]
  def change
    create_table :picks do |t|
      t.references :users, null: false, foreign_key: true
      t.references :groups, null: false, foreign_key: true

      t.timestamps
    end
  end
end
