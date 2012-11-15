class Order < ActiveRecord::Base
  attr_accessible :content, :user_id, :place_id, :state, :state_cd

  belongs_to :user
  belongs_to :place

  as_enum :state, [:fresh, :confirmed, :rejected], prefix: true
end
