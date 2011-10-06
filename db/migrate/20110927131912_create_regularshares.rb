class CreateRegularshares < ActiveRecord::Migration
  def change
    create_table :regularshares do |t|
      t.integer :user_id
      t.integer :source_id
      t.integer :destination_id
      t.datetime :starttime
      t.datetime :endtime
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :vehicle
      t.integer :amount
      t.integer :numofpassengers
      t.text :details

      t.timestamps
    end
	add_index :regularshares, :user_id
	add_index :regularshares, :source_id
	add_index :regularshares, :destination_id
  end
end
