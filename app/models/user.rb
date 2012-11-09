class User < ActiveRecord::Base
  attr_accessible :avatar, :first_name, :last_name

  mount_uploader :avatar, UserAvatarUploader
end
