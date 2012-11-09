class User < ActiveRecord::Base
  attr_accessible :avatar, :first_name, :last_name
end
