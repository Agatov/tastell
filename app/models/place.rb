class Place < ActiveRecord::Base
  attr_accessible :address, :avatar, :average_check, :description, :latitude, :longitude, :name, :phone, :logo
  attr_accessible :schedule, :public_phone, :kitchen, :metro, :active

  has_one :place_requisites
  has_many :orders
  has_many :photos
  belongs_to :account

  include PlaceConcerns::Balance
  include PlaceConcerns::Stats

  mount_uploader :avatar, PlaceAvatarUploader
  mount_uploader :logo, PlaceLogoUploader

  geocoded_by :address
  before_create :generate_hash_code
  after_validation :geocode, if: :address_changed?
  after_create :create_place_requisites

  acts_as_api
  include ApiV1::Place

  define_index do
    indexes name, address

    has "RADIANS(`places`.`latitude`)", as: :latitude, type: :float
    has "RADIANS(`places`.`longitude`)", as: :longitude, type: :float
  end

  sphinx_scope(:by_point) { |latlng|
    if !latlng.nil?
      {geo: latlng, with: {'@geodist' => 0.0..10000.0}, order: '@geodist asc'}
    else
      {}
    end
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

  def active?
    active
  end

  def add_view(params = {})
    view = place_views.build()
    view.ip_address = params[:ip_address]
    view.order ||= params[:order]
    view.user ||= params[:user]
    view.save
  end

  def self.str_to_latlng
    latlng = self.split(',')
    latitude = latlng.first.to_f
    longitude = latlng.last.to_f
    [latitude, longitude]
  end

  private

  def create_place_requisites
    requisites = self.build_place_requisites
    requisites.save
  end
end
