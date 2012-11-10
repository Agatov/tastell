class AuthenticationsController < ApplicationController

  layout "mobile"

  def new
    respond_to do |format|
      format.html
      #format.mobile
    end
  end

  def create
  end
end