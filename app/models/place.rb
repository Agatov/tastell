class Place < ActiveRecord::Base
  attr_accessible :address, :avatar, :average_check, :description, :latitude, :longitude, :name, :phone, :logo
  attr_accessible :schedule, :public_phone, :kitchen, :metro
  attr_accessible :balance, :credit

  has_many :orders
  has_many :photos
  belongs_to :account

  mount_uploader :avatar, PlaceAvatarUploader
  mount_uploader :logo, PlaceLogoUploader

  geocoded_by :address
  before_create :generate_hash_code
  after_validation :geocode, if: :address_changed?

  acts_as_api
  include ApiV1::Place

  define_index do
    indexes name, address

    has "RADIANS(`places`.`latitude`)", as: :latitude, type: :float
    has "RADIANS(`places`.`longitude`)", as: :longitude, type: :float
  end

  sphinx_scope(:by_point) { |latlng|
    {geo: latlng, with: {"@geodist" => 0.0..1000.0}}
  }

  def avatar_wide
    avatar_url(:wide) if avatar?
  end

  # @param [Account] account
  def can_be_changed_by?(account)
    account.id == account_id
  end

  def generate_hash_code
    self.hash_code =  Digest::MD5.hexdigest(Time.now.to_s)[0...16]
  end
end
