class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :count
      t.references :user, null: false, foreign_key: true
      t.references :pick, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :votes
  end
end
