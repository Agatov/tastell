class CreatePlaceMenuItems < ActiveRecord::Migration
  def change
    create_table :place_menu_items do |t|
      t.integer :place_menu_category_id
      t.integer :pid, default: 0
      t.string :name
      t.string :description
      t.integer :price, default: 0
      t.boolean :active, default: 0

      t.timestamps
    end
  end
end
