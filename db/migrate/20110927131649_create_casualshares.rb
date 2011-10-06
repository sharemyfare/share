class CreateCasualshares < ActiveRecord::Migration
  def change
    create_table :casualshares do |t|
      t.integer :user_id
      t.integer :source_id
      t.integer :destination_id
      t.datetime :starttime
      t.datetime :endtime
      t.string :vehicle
      t.integer :amount
      t.integer :numofpassengers
      t.text :details

      t.timestamps
    end
	add_index :casualshares, :user_id
	add_index :casualshares, :source_id
	add_index :casualshares, :destination_id
  end
end
