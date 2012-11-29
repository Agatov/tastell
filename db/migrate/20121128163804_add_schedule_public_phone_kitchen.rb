class AddSchedulePublicPhoneKitchen < ActiveRecord::Migration
  def up
    add_column :places, :schedule, :string
    add_column :places, :public_phone, :string
    add_column :places, :kitchen, :string
  end

  def down
    remove_column :places, :schedule
    remove_column :places, :public_phone
    remove_column :places, :kitchen
  end
end
