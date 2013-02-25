class Admin::CommentsController < Admin::AdminController

  layout 'admin'

  def new
    @place = Place.find(params[:place_id])
    @comment = @place.orders.build
  end

  def create
    @place = Place.find(params[:place_id])
    @order = @place.orders.build(params[:order])
    @order.attributes = {  moderated: true, state: :fake }

    if @order.save
      redirect_to admin_place_path(@order.place)
    else
      render :new
    end
  end

  def edit
    @place = Place.find(params[:place_id])
    @comment = Order.find(params[:id])
  end

  def update
    @comment = Order.find(params[:id])

    if @comment.update_attributes(params[:order])
      redirect_to admin_place_path(@order.place)
    else
      render :edit
    end
  end

  def destroy
    @comment = Order.find(params[:id])
    @comment.destroy
    redirect_to admin_place_path(@comment.place)
  end
end