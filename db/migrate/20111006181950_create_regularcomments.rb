class CreateRegularcomments < ActiveRecord::Migration
  def change
    create_table :regularcomments do |t|
      t.integer :regularshare_id
      t.integer :user_id
      t.text :details

      t.timestamps
    end
  end
end
