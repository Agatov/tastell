class AddDateToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :date, :date
  end

  def down
    remove_column :orders, :date, :date
  end
end
