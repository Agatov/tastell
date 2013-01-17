class Account < ActiveRecord::Base
  attr_accessible :avatar, :blocked, :email, :first_name, :last_name, :login, :password

  has_many :places

  def can_authorize?(params)
    password == params[:password]
  end
end
