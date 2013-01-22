class AuthenticationsController < ApplicationController

  layout 'authentication'
  before_filter :mobile_device?

  def new
  end

  #####
  # Ахтунг! Хардкод для vk
  #####
  def create
    @auth = request.env['omniauth.auth']
    @authentication = Authentication.find_or_create_by_provider_cd_and_uid(0, @auth['uid'])
    @authentication.token = @auth['credentials']['token']

    if @authentication.user.present?
      login @authentication.user
    else
      @user = User.new()

      @user.first_name = @auth['info']['first_name']
      @user.last_name = @auth['info']['last_name']
      @user.remote_avatar_url = @auth.extra.raw_info.photo_big!

      @authentication.user = @user
      @authentication.save

      login @user
    end

  end

  private

  # @param [User] user
  def login(user)
    session[:user_id] = user.id.to_s
  end

  def logout
    session[:user_id] = nil
  end
end