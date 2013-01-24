class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  before_filter :set_last_viewed_path

  def mobile_device?
    #request.format = :mobile unless request.format == :json
    #return false

    if request.user_agent =~ /Mobile|webOS/
      request.format = :mobile unless request.format == :json

      #if request.fullpath == root_path
      #  redirect_to new_authentication_path
      #end

      true
    end
  end

  def set_last_viewed_path
    session[:last_viewed_path] = current_path
  end

  def last_viewed_path
    session[:last_viewed_path]
  end

  def authenticate_user!
    not_found unless user_logged_in?
  end

  def not_found
    raise ActiveRecord::RecordNotFound.new('not found')
  end

  def render_not_found
    render json: {status: :not_found}
  end

  def current_user
    if session[:user_id] and !session[:user_id].empty?
      @current_user ||= User.find(session[:user_id])
    end
  end

  def user_logged_in?
    return false if session[:user_id] and session[:user_id].empty?
    return session[:user_id] ? true : false
  end

  helper_method :current_user
  helper_method :user_logged_in?
end
