class AddTableNumberToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :table_number, :integer, default: 0
  end
end
