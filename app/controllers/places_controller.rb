class PlacesController < ApplicationController

  before_filter :mobile_device?

  def index

    if params[:latlng]
      latlng = params[:latlng].split(',')
      latitude = latlng.first.to_f
      longitude = latlng.last.to_f

      @places = Place.search(
          geo: Geocoder::Calculations.to_radians([latitude, longitude]),
          with: {'@geodist' => 0.0..10000.0},
          order: '@geodist asc'
      )
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