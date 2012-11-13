class PlacesController < ApplicationController

  before_filter :mobile_device?

  def index
    @places = Place.order(:id)
  end

  def show
    @place = Place.find(params[:id])
  end
end