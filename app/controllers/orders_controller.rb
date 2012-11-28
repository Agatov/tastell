class OrdersController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!

  def create
    order = current_user.orders.create(params[:order])

    if order.save
      render json: {status: :ok, order_id: order.id, url: vk_social_url(order)}
    else
      render json: {status: :error}
    end
  end

  def check
    if find_order.check.state_confirmed?
      render json: {status: :success}
    else
      render json: {status: :not_found}
    end
  end

  private

  def find_order
    Order.find(params[:id]) || not_found
  end
end