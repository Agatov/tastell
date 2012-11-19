class Place < ActiveRecord::Base
  attr_accessible :address, :avatar, :average_check, :description, :latitude, :longitude, :name, :phone, :logo

  has_many :orders
  has_many :photos

  mount_uploader :avatar, PlaceAvatarUploader
  mount_uploader :logo, PlaceLogoUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_api
  include ApiV1::Place

  define_index do
    indexes name

    has "RADIANS(`places`.`latitude`)", as: :latitude, type: :float
    has "RADIANS(`places`.`longitude`)", as: :longitude, type: :float
  end

  sphinx_scope(:by_point) { |latlng|
    {geo: latlng, with: {"@geodist" => 0.0..1000.0}}
  }
end
