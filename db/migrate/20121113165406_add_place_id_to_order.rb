class AddPlaceIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :place_id, :integer
  end
end
