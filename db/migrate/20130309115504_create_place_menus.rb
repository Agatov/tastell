class CreatePlaceMenus < ActiveRecord::Migration
  def change
    create_table :place_menus do |t|
      t.integer :place_id
      t.string :name
      t.boolean :active, default: 0

      t.timestamps
    end
  end
end
