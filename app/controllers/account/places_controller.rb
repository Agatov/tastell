class Account::PlacesController < AccountsController

  before_filter :autheticate_account!

  def index
    @places = current_account.places.order(:id)
  end

  def show
    @place = find_place
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to account_places_path }
      else
        format.html { render :new }
      end
    end
  end

  def description
    @place = find_place
  end

  def edit
    @place = find_place
  end

  def update
    @place = find_place

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to account_places_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @place = find_place
    @place.destroy

    respond_to do |format|
      format.html { redirect_to account_places_path }
    end
  end

  private

  def find_place
    place = Place.find(params[:id]) || raise(Exception('not found'))

    if place.can_be_changed_by? current_account
      place
    else
      redirect_to places_path
    end
  end

end