class PagesController < ApplicationController
  def index
    @places = Place.order(:id).limit(6)
  end

  def show

  end
end