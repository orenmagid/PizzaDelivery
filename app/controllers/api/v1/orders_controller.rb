class Api::V1::OrdersController < ApplicationController
  before_action :find_order, only: [:update]

  def index
    @orders = Order.all
    render json: @orders
  end

  def create
    @order = Order.new(order_params)

    @order.user = @current_user
    @order.save
    render json: @order
  end

  def update
    @order.update(order_params)
    render json: @order
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id, :date_time, :address)
  end
end
