class OrdersController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!
  rescue_from OrderExceptions::TooManyOrdersError, with: :duplicated_order

  # @todo сделать модерацию по умолчанию.
  def create
    @order = current_user.orders.build(params[:order])
    @order.moderated = true

    if current_user.create_order(@order)
      render json: {status: :ok, order_id: @order.id, url: vk_social_url(@order)}
    else
      render json: {status: :error}
    end
  end

  def check
    @order = find_order

    if @order.check.state_confirmed?
      render json: {status: :success}
    else
      render json: {status: :error}
    end
  end

  private

  def find_order
    Order.find(params[:id]) || not_found
  end

  def render_order_error
    render json: {status: :error}
  end

  def duplicated_order
    render json: {status: :duplicate}
  end
end