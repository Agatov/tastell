class Order < ActiveRecord::Base
  attr_accessible :content, :user_id, :place_id

  belongs_to :user
  belongs_to :place
end
