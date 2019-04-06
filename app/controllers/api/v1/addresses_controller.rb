class Api::V1::AddressesController < ApplicationController
  before_action :find_addresses, only: [:update]

  def index
    @addresses = Address.all
    render json: @addresses
  end

  def create
    @address = Address.new(address_params)

    @address.user = @current_user
    if @address.save
      render json: @address
    else
      render json: { error: 'There was a problem with the address you entered. Please try again.' }
    end
  end

  def update
    @address.update(address_params)
    render json: @address
  end

  private

  def find_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:full_address, :longitude, :lattitude, :user_id)
  end
end
