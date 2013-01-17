class Account < ActiveRecord::Base
  attr_accessible :avatar, :blocked, :email, :first_name, :last_name, :login, :password
end
