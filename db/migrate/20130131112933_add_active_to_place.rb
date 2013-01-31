class AddActiveToPlace < ActiveRecord::Migration
  def change
    add_column :places, :active, :boolean, default: 0
  end
end
