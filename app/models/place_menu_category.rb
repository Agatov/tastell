class PlaceMenuCategory < ActiveRecord::Base
  attr_accessible :active, :name, :pid, :place_menu_id

  belongs_to :place_menu
  has_many :place_menu_items
end
