class Place < ActiveRecord::Base
  attr_accessible :address, :avatar, :average_check, :description, :latitude, :longitude, :name, :phone
end
