class User < ActiveRecord::Base
  attr_accessible :avatar, :first_name, :last_name

  mount_uploader :avatar, UserAvatarUploader

  has_many :orders
  has_one :authentication

  def full_name
    "#{first_name} #{last_name}"
  end

  def build_order(params)
    orders.create!(params) if can_create_order?
  end

  def can_create_order?
    orders.confirmed.last.created_at < 2.hours.ago(Time.now)
  end
end
