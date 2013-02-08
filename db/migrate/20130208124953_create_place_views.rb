class CreatePlaceViews < ActiveRecord::Migration
  def change
    create_table :place_views do |t|
      t.integer :place_id
      t.integer :user_id
      t.integer :order_id
      t.string :ip_address

      t.timestamps
    end
  end
end
