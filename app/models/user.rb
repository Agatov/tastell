class User < ActiveRecord::Base
  attr_accessible :avatar, :first_name, :last_name

  mount_uploader :avatar, UserAvatarUploader

  has_many :orders
  has_one :authentication

  def full_name
    "#{first_name} #{last_name}"
  end
end
