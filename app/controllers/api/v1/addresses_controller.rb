require 'pry'
class Api::V1::AddressesController < ApplicationController
  before_action :find_address, only: %i[update show destroy]

  def index
    @addresses = Address.recent
    render json: @addresses, status: :ok
  end

  def show
    render json: @address, status: :ok
  end

  def create
    @address = Address.new(address_params)

    @address.user = if params[:address][:user_id]
                      User.find_by(id: params[:address][:user_id])
                    else
                      @current_user
                    end

    if @address.save

      render json: @address, status: :created
    else
      render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @address.update(address_params)
      render json: @address, status: :accepted
    else
      render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @address.destroy
    render json: @address, status: :ok
  end

  private

  def find_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:location, :longitude, :lattitude, :user_id)
  end
end
