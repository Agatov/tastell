class ChangePlaceHashCodeType < ActiveRecord::Migration
  def up
    change_column :places, :hash_code, :string, default: nil
  end

  def down
    change_column :places, :hash_code, :string
  end
end
