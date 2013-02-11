class Place::CommentsController < ApplicationController

  def index
    @place = Place.find(params[:place_id])
    @orders = @place.orders.includes(:user).order('created_at desc').limit(20)

    respond_to do |format|
      format.json {
        render_for_api :list, json: @orders
      }
    end
  end
end