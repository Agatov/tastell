class AddModeratedToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :moderated, :boolean, default: false
  end
end
