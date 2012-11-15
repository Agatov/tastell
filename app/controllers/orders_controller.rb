class OrdersController < ApplicationController

  include ApplicationHelper

  def index
  end

  def new
  end

  def create
    @order = User.find(1).orders.create(params[:order])

    if @order.save
      render json: {status: :ok, order_id: @order.id, url: vk_social_url(@order)}
    else
      render json: {status: :error}
    end
  end

  def check
    @order = Order.find(params[:id])

    if @order.check.state_confirmed?
      render json: {status: :success}
    else
      render json: {status: :not_found}
    end
  end
end