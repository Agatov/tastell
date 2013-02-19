class Admin::PlacesController < ApplicationController

  layout 'admin'

  def index
    @places = Place.order(:id)
  end

  def show
    @place = Place.find(params[:id])
  end
end