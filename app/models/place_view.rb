class PlaceView < ActiveRecord::Base
  attr_accessible :ip_address, :order_id, :place_id, :user_id

  belongs_to :place
  belongs_to :order
  belongs_to :user

  scope :by_date, lambda { |time| where(created_at: [time.yesterday.midnight, time.midnight]) unless time.nil? }
end
