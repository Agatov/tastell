class AddHashCodeToPlace < ActiveRecord::Migration
  def up
    add_column :places, :hash_code, :string
  end

  def down
    remove_column :places, :hash_code
  end
end
