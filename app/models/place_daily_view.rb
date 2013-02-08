class PlaceDailyView < ActiveRecord::Base
  attr_accessible :date, :order_hits_count, :order_hosts_count, :place_id, :total_hits_count, :total_hosts_count
end
