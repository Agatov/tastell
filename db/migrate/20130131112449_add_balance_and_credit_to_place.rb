class AddBalanceAndCreditToPlace < ActiveRecord::Migration
  def change
    add_column :places, :balance, :integer, default: 0
    add_column :places, :credit, :integer, default: 0
  end
end
