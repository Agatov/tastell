class Account::PlaceRequisitesController < AccountsController

  layout 'account'

  def edit
    @place = find_place
    @place_requisites = find_place_requisites
  end

  def update
    @place = find_place
    @place_requisites = find_place_requisites

    if @place_requisites.update_attributes(params[:place_requisites])
      redirect_to account_place_path(@place)
    else
      render :edit
    end
  end

  private

  def find_place
    Place.find(params[:place_id])
  end

  def find_place_requisites
    PlaceRequisites.find(params[:id])
  end
end