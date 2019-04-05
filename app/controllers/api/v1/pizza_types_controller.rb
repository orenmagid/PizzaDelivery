class Api::V1::PizzaTypesController < ApplicationController
  before_action :find_pizza_type, only: [:update]

  def index
    @pizza_types = PizzaType.all
    render json: @pizza_types
  end

  def create
    @pizza_type = PizzaType.new(pizza_type_params)
    @pizza_type.save
    render json: @pizza_type
  end

  def update
    @pizza_type.update(pizza_types_params)
    render json: @pizza_type
  end

  private

  def find_pizza_type
    @pizza_type = PizzaType.find(params[:id])
  end

  def pizza_type_params
    params.require(:pizza_type).permit(:name, :price)
  end
end
