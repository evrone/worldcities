class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.integer :country_id, null: false
      t.string :code, null: false
      t.string :name
    end
    # readonly table, index everything
    add_index :regions, :country_id
    add_index :regions, :code
    add_index :regions, :name
  end
end
