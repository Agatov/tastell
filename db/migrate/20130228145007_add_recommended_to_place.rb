class AddRecommendedToPlace < ActiveRecord::Migration
  def change
    add_column :places, :recommended, :boolean, default: 0
  end
end
