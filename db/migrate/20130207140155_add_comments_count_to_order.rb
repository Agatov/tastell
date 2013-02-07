class AddCommentsCountToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :comments_count, :integer, default: 0
  end
end
