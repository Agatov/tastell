class Photo < ActiveRecord::Base
  attr_accessible :image, :pid, :place_id

  belongs_to :place

  mount_uploader :image, PhotoImageUploader
end
