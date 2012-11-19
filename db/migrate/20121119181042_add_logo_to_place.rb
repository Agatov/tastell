class AddLogoToPlace < ActiveRecord::Migration
  def change
    add_column :places, :logo, :string
  end
end
