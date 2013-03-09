class PlaceMenu < ActiveRecord::Base
  attr_accessible :name, :place_id

  belongs_to :place
  has_many :place_menu_categories
end
