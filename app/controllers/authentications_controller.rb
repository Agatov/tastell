class AuthenticationsController < ApplicationController

  before_filter :mobile_device?

  def new
  end

  def create
    @auth = request.env['omniauth.auth']
    @new_user = true

    #####
    # ALARM
    # Этот грязный код - только для ВК
    #####
    @authentication = Authentication.find_or_create_by_provider_cd_and_uid(0, @auth['uid'])
    @authentication.token = @auth['credentials']['token']

    if @authentication.user.present?
      @new_user = false
      login @authentication.user

      # Сохраняем, дабы не проебать токен
      @authentication.save
    else
      @user = User.new()

      # В начале у нас будет работа только с VK. Поэтому и код пишем соответственно

      @user.first_name = @auth['info']['first_name']
      @user.last_name = @auth['info']['last_name']
      @user.remote_avatar_url = @auth.extra.raw_info.photo_big!

      @authentication.user = @user
      @authentication.save

      login @user

      if format.mobile
        redirect_to places_path
      else
        render json: "OLOLOLO"
      end
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