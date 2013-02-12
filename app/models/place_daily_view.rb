class PlaceDailyView < ActiveRecord::Base
  attr_accessible :date, :order_hits_count, :order_hosts_count, :place_id, :hits_count, :hosts_count

  belongs_to :place
end
