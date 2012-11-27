class PagesController < ApplicationController

  before_filter :mobile_device?

  def index
    @places = Place.order(:id).limit(6)
  end

  def show

  end
end