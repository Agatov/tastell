class AddConfirmedRejectedAtToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :confirmed_at, :datetime
    add_column :orders, :rejected_at, :datetime
  end
end
