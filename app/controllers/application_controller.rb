class ApplicationController < ActionController::Base
  protect_from_forgery



  def mobile_device?

    request.format = :mobile unless request.format == :json
    return false

    if request.user_agent =~ /Mobile|webOS/
      request.format = :mobile unless request.format == :json

      if request.fullpath == root_path
        redirect_to new_authentication_path
      end

      true
    end
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
