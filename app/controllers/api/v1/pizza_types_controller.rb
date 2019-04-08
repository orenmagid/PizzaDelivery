class Api::V1::PizzaTypesController < ApplicationController
  before_action :find_pizza_type, only: %i[update show]

  def index
    @pizza_types = PizzaType.all
    render json: @pizza_types, status: :ok
  end

  def show
    render json: @pizza_type, status: :ok
  end

  def create
    @pizza_type = PizzaType.new(pizza_type_params)
    if @pizza_type.save
      render json: @pizza_type, status: :created
    else
      render json: { errors: @pizza_type.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    if @pizza_type.update(pizza_type_params)
      render json: @pizza_type, status: :accepted
    else
      render json: { errors: @pizza_type.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @pizza_type = PizzaType.find(params[:id])
    @pizza_type.destroy
    render json: @pizza_type, status: :ok
  end

  private

  def find_pizza_type
    @pizza_type = PizzaType.find(params[:id])
  end

  def pizza_type_params
    params.require(:pizza_type).permit(:name, :price)
  end
end
