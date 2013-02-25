class AddFakeToUser < ActiveRecord::Migration
  def up
    add_column :users, :fake, :boolean, default: 0
  end

  def down
    remove_column :users, :fake
  end
end
