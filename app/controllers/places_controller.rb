class PlacesController < ApplicationController

  layout "mobile"

  def index
    @places = Place.order(:id)
  end

  def show
    @place = Place.find(params[:id])
  end
end