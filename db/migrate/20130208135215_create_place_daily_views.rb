class CreatePlaceDailyViews < ActiveRecord::Migration
  def up
    create_table :place_daily_views do |t|
      t.integer :place_id
      t.integer :hosts_count, default: 0
      t.integer :hits_count, default: 0
      t.integer :order_hits_count, default: 0
      t.integer :order_hosts_count, default: 0
      t.date :date

      t.timestamps
    end
  end

  def down
    drop_table :place_daily_views
  end
end
