class CreatePlaceMenuCategories < ActiveRecord::Migration
  def change
    create_table :place_menu_categories do |t|
      t.integer :place_menu_id
      t.integer :pid, default: 0
      t.string :name
      t.boolean :active, default: 0

      t.timestamps
    end
  end
end
