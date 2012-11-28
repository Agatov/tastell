class OrdersController < ApplicationController
  include ApplicationHelper
  #before_filter :authenticate_user!
  rescue_from Exceptions::OrderCantBeCreatedError, with: :render_order_error

  def create
    order = build_order
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

  def build_order
    current_user.build_order(params[:order]) || order_cant_be_created
  end

  def order_cant_be_created
    raise Exceptions::OrderCantBeCreatedError.new("order can't be created")
  end

  def find_order
    Order.find(params[:id]) || not_found
  end

  def render_order_error
    render json: {status: :error}
  end
end