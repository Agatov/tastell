class AddAccountIdToPlace < ActiveRecord::Migration
  def up
    add_column :places, :account_id, :integer
  end

  def down
    remove_column :places, :account_id
  end
end
