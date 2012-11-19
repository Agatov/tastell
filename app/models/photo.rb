class Photo < ActiveRecord::Base
  attr_accessible :image, :pid, :place_id

  belongs_to :place
end
