class Photos < ActiveRecord::Base
  attr_accessible :image, :pid, :place_id
end
