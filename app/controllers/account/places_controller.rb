class Account::PlacesController < ApplicationController

  layout "account"

  before_filter :find_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = current_account.places
  end

  def show

  end

  def new
    @place = Place.new
  end

  def create
    @place = current_account.places.build(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to account_places_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to account_places_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @place.destroy

    respond_to do |format|
      format.html { redirect_to account_places_path }
    end
  end

  private

  def find_place
    @place = Place.find(params[:id])
  end

end