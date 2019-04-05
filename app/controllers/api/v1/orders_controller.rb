require 'pry'

class Api::V1::OrdersController < ApplicationController
  before_action :find_order, only: [:update]

  def index
    @orders = Order.all
    render json: @orders
  end

  def create
    address = Address.find(params[:order][:address_id])
    if Address.too_far_from_chronicle(address)
      render json: { error: 'You are too far from the Chronicle. We are located at 1255 23rd St NW # 700, Washington, DC 20037. Let us know when you are a bit closer, and we would be happy to deliver.' }
    else
      @order = Order.new
      order_items = params[:order][:order_items]

      order_items.each do |order_item|
        order_item.permit!
        @item = OrderItem.new(order_item)
        @order.order_items << @item
      end
      @order.calculate_tax_and_total
      @order.address = address
      @order.user = @current_user
      @order.date_time = Time.now
      @order.save
      render json: @order

    end
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
    params.require(:order).permit(:id, :user_id, :date_time, :address_id, order_items: %i[quantity pizza_type_id])
  end
end
