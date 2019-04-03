class Api::V1::PizzaTypesController < ApplicationController
  before_action :find_pizza_types, only: [:update]

  def index
    @pizza_types = PizzaType.all
    render json: @pizza_types
  end

  def create
    @pizza_types = PizzaType.new(pizza_types_params)

    @pizza_types.user = @current_user
    @pizza_types.save
    render json: @pizza_types
  end

  def update
    @pizza_types.update(pizza_types_params)
    render json: @pizza_types
  end

  private

  def find_pizza_types
    @pizza_types = PizzaType.find(params[:id])
  end

  def pizza_types_params
    params.require(:pizza_types).permit(:name, :price)
  end
end
