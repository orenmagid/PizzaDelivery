class Api::V1::AddressesController < ApplicationController
  before_action :find_address, only: %i[update show destroy]

  def index
    @addresses = Address.all
    render json: @addresses
  end

  def show
    render json: @address
  end

  def create
    @address = Address.new(address_params)
    @address.user = @current_user

    if @address.save

      render json: { address: @address }, status: :created
    else
      render json: { errors: @address.errors.full_messages }, status: 500
    end
  end

  def update
    if @address.update(address_params)
      render json: @address
    else
      render json: { errors: @address.errors.full_messages, status: :bad_request }
    end
  end

  def destroy
    @address.destroy
    render json: { address: @address }, status: :ok
  end

  private

  def find_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:location, :longitude, :lattitude, :user_id)
  end
end
