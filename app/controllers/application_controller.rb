class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def mobile_device?
    #request.format = :mobile unless request.format == :json
    #return false
    if request.host.include?("m.")
      request.format = :mobile unless request.format == :json
      redirect_to new_authentication_path if request.fullpath == root_path
    end
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
