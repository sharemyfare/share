class CreateRegularsubscriptions < ActiveRecord::Migration
  def change
    create_table :regularsubscriptions do |t|
      t.integer :user_id
      t.integer :regularshare_id
      t.integer :amount
      t.integer :passengers
      t.boolean :status
      t.text :details

      t.timestamps
    end
    add_index :regularsubscriptions, :user_id
    add_index :regularsubscriptions, :regularshare_id
  end
end
