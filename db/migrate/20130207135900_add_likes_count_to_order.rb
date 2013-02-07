class AddLikesCountToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :likes_count, :integer, default: 0
  end
end
