class Api::V1::OrderItemsController < ApplicationController
  before_action :find_order_items, only: [:update]

  def index
    @order_items = OrderItem.all
    render json: @order_items
  end

  def create
    @order_items = OrderItem.new(order_items_params)
    render json: @order_items
  end

  def update
    @order_items.update(order_items_params)
    render json: @order_items
  end

  private

  def find_order_items
    @order_items = OrderItem.find(params[:id])
  end

  def order_items_params
    params.require(:order_items).permit(:pizza_type_id, :quantity, :address_id)
  end
end
