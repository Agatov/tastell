class PlacesController < ApplicationController

  before_filter :mobile_device?

  def index
    if params[:search]
      @places = Place.by_point(LatLng.new(params[:search][:latlng]).to_radiance).search(params[:search][:string])
    else
      @places = Place.order(:id)
    end

    respond_to do |format|
      format.html
      format.mobile
      format.json {
        render_for_api :list, json: @places, meta: {status: :ok}
      }
    end
  end

  def show
    @place = Place.find(params[:id])
    @last_orders = @place.orders.only_moderated.order('created_at desc')

    respond_to do |format|
      format.html {
        render layout: "application_place"
      }
      format.mobile
    end
  end
end