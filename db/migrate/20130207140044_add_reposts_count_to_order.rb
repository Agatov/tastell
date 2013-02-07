class AddRepostsCountToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :reposts_count, :integer, default: 0
  end
end
