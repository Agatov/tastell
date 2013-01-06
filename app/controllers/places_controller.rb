class PlacesController < ApplicationController

  before_filter :mobile_device?

  def index
    @places = Place.order(:id)

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
    @last_orders = @place.orders

    respond_to do |format|
      format.html {
        render layout: "application_place"
      }
      format.mobile
    end
  end
end