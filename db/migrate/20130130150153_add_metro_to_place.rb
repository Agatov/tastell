class AddMetroToPlace < ActiveRecord::Migration
  def change
    add_column :places, :metro, :string
  end
end
