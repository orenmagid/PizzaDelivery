require 'pry'

class Api::V1::OrdersController < ApplicationController
  before_action :find_order, only: %i[show update destroy]

  def index
    @orders = Order.all
    render json: @orders, status: :ok
  end

  def show
    render json: @order, status: :ok
  end

  def create
    address = Address.find(params[:order][:address_id])
    @order = Order.new
    order_items = params[:order][:order_items] || params[:order_items]
    if order_items.length === 0
      render json: { errors: 'Please add items to your order.' }, status: :bad_request
    else

      order_items.each do |order_item|
        order_item.permit!
        @item = OrderItem.new(order_item)
        @order.order_items << @item

        @order.calculate_tax_and_total
        @order.address = address
        @order.user = @current_user
        @order.date_time = Time.now
        if @order.save
          render json: @order, status: :created
        else
          render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    if @order.update(order_params)
      render json: @order, status: :accepted
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    render json: @order, status: :ok
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:id, :user_id, :date_time, :address_id, order_items: %i[quantity pizza_type_id])
  end
end
