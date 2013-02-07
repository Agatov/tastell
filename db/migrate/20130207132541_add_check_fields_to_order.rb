class AddCheckFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :first_time_checked_at, :datetime
    add_column :orders, :last_time_checked_at, :datetime
    add_column :orders, :checks_count, :integer, default: 0
  end
end
