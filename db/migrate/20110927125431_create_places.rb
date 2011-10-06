class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :placename
      t.integer :city_id

      t.timestamps
    end
      add_index :places, :city_id
  end
end
