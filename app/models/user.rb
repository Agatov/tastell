class User < ActiveRecord::Base
  attr_accessible :avatar, :first_name, :last_name

  mount_uploader :avatar, UserAvatarUploader

  has_many :orders
  has_one :authentication

  def full_name
    "#{first_name} #{last_name}"
  end

  # @param [Order] order
  def create_order(order)
    return false unless can_create_order?(order.place)
    order.save
  end

  # @param [Place] place
  def can_create_order?(place)
    orders.with_place(place).confirmed.today.empty?
  end
end
