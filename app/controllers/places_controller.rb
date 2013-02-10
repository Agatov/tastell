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
    meta_tags_for(@place)

    view_place(@place)

    respond_to do |format|
      format.html {
        render layout: "application_place"
      }
      format.mobile
    end
  end

  private

  def view_place(place)
    view_params = {}

    view_params[:order] =  Order.find(params[:o]) if params[:o]
    view_params[:user] = current_user if user_logged_in?
    view_params[:ip_address] = request.remote_ip

    place.add_view(view_params)
  end

  def meta_tags_for(place)
    set_meta_tags title: place.name
  end
end