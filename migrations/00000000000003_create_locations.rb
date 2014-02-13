class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :country_id, null: false
      t.integer :region_id
      t.string  :name,       null: false
      t.string  :map_name,   null: false
      t.float   :lat,        null: false
      t.float   :lon,        null: false
      t.integer :population
      t.string  :url_value,  null: false
    end

    # readonly table, heavy indexing
    add_index :locations, :country_id
    add_index :locations, :region_id
    add_index :locations, :map_name
    add_index :locations, [:lat, :lon]
    add_index :locations, :url_value
  end
end
