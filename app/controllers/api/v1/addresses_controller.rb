class AddressesController < ApplicationController
  before_action :find_addresses, only: [:update]

  def index
    @addresses = Address.all
    render json: @addresses
  end

  def create
    @address = Address.new(addresses_params)

    @address.user = @current_user
    @address.save
    render json: @address
  end

  def update
    @address.update(address_params)
    render json: @address
  end

  private

  def find_addresses
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:addresses).permit(:full_address, :longitude, :lattitude, :user_id)
  end
end
