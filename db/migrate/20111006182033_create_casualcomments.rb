class CreateCasualcomments < ActiveRecord::Migration
  def change
    create_table :casualcomments do |t|
      t.integer :casualshare_id
      t.integer :user_id
      t.text :details

      t.timestamps
    end
  end
end
