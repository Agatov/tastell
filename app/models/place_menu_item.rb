class PlaceMenuItem < ActiveRecord::Base
  attr_accessible :description, :name, :pid, :place_menu_category_id, :price

  belongs_to :place_menu_category
end
