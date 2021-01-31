class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :firstname
      t.string :lastname
      t.integer :wallet
      t.date :join_date

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
