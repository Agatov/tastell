class ApplicationController < ActionController::Base
  protect_from_forgery

  def mobile_device?
    if request.user_agent =~ /Mobile|webOS/
      request.format = :mobile
      response
      true
    end
  end

  #helper_method :mobile_device?
end
