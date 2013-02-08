class PlaceView < ActiveRecord::Base
  attr_accessible :ip_address, :order_id, :place_id, :user_id
end
