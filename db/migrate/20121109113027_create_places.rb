class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :avatar
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.integer :average_check

      t.timestamps
    end
  end
end
