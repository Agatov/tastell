class AddPopularToPlace < ActiveRecord::Migration
  def change
    add_column :places, :popular, :boolean, default: 0
  end
end
