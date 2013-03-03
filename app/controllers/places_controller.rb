class PlacesController < ApplicationController

  before_filter :mobile_device?

  def index
    if params[:search]
      @places = Place.by_point(LatLng.new(params[:search][:latlng]).to_radiance).search(params[:search][:string])
      layout = 'search'
    else
      @places = Place.active.order('id desc')
      layout = 'application'
    end

    respond_to do |format|
      format.html {
        render layout: layout
      }
      format.mobile
      format.json {
        render_for_api :list, json: @places, meta: {status: :ok}
      }
    end
  end

  def map
    @places = Place.order(:id)
    respond_to do |format|
      format.html {
        render layout: 'map'
      }
      format.json {
        render_for_api :list, json: @places
      }
    end
  end

  def list
    @places = Place.order('id desc').page(params[:page]).per(8)
    respond_to do |format|
      format.json {
        render_for_api :list, json: @places
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

    if params[:o]
      begin
        view_params[:order] = Order.find(params[:o])
      rescue Exception => e
        view_params[:order] = nil
      end
    end

    view_params[:user] = current_user if user_logged_in?
    view_params[:ip_address] = request.remote_ip

    place.add_view(view_params)
  end

  def meta_tags_for(place)
    set_meta_tags title: place.name
  end
end