class Admin::PlacesController < Admin::AdminController

  layout 'admin'

  def index
    @places = Place.order(:id)
  end

  def show
    @place = Place.find(params[:id])

    @comments = @place.orders.order('id desc')
  end
end