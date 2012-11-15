class Authentication < ActiveRecord::Base
  attr_accessible :provider, :provider_cd, :token, :uid, :user_id

  belongs_to :user

  as_enum :provider, [:vkontakte], prefix: true
end
