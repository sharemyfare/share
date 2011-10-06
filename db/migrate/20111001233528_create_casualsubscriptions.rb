class CreateCasualsubscriptions < ActiveRecord::Migration
  def change
    create_table :casualsubscriptions do |t|
      t.integer :user_id
      t.integer :casualshare_id
      t.integer :amount
      t.integer :passengers
      t.boolean :status
      t.text :details

      t.timestamps
    end
    add_index :casualsubscriptions, :user_id
    add_index :casualsubscriptions, :casualshare_id
  end
end
