class Api::V1::OrderItemsController < ApplicationController
  before_action :find_order_item, only: %i[update show destroy]

  def index
    @order_items = OrderItem.all
    render json: @order_items
  end

  def show
    render json: @order_item
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    if @order_item.save
      render json: @order_item
    else
      render json: { errors: @order_item.errors.full_messages }
    end
  end

  def update
    if @order_item.update(order_item_params)
      render json: @order_item
    else
      render json: { errors: @order_item.errors.full_messages }
    end
  end

  def destroy
    @order_item.destroy
    render json: { order_item: @order_item, status: :ok }
  end

  private

  def find_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:pizza_type_id, :quantity, :order_id)
  end
end
