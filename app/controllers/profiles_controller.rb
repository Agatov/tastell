class ProfilesController < ApplicationController

  def show
  end

  def edit

  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to('profile/show')
    else
      render(:edit)
    end
  end

end