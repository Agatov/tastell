class User < ActiveRecord::Base
  attr_accessible :avatar, :first_name, :last_name

  mount_uploader :avatar, UserAvatarUploader

  has_many :orders
  has_one :authentication

  def full_name
    "#{first_name} #{last_name}"
  end

  def can_create_order?
    return true if orders.confirmed.empty?
    orders.confirmed.last.created_at < 2.hours.ago(Time.now)
  end
end
