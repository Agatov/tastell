class ApplicationController < ActionController::Base
  protect_from_forgery

  def mobile_device?

    request.format = :mobile unless request.format == :json

    #if request.user_agent =~ /Mobile|webOS/
    #  request.format = :mobile
    #  true
    #end
  end

  #helper_method :mobile_device?
end
