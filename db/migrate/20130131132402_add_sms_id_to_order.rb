class AddSmsIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :sms_id, :integer
  end
end
