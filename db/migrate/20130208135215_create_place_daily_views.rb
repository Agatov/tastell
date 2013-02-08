class CreatePlaceDailyViews < ActiveRecord::Migration
  def change
    create_table :place_daily_views do |t|
      t.integer :place_id
      t.integer :total_hits_count, default: 0
      t.integer :total_hosts_count, default: 0
      t.integer :order_hits_count, default: 0
      t.integer :order_hosts_count, default: 0
      t.date :date

      t.timestamps
    end
  end
end
