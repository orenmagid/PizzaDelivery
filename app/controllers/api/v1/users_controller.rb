class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]
  before_action :find_user, only: %i[show update]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show_user
    render json: @current_user, status: :ok
  end

  def show
    render json: @current_user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      token = encode(user_id: @user.id)
      render json: { token: token, success: true }, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?

    @current_user.update(user_params)
    if @current_user.save
      render json: @current_user, status: :accepted
    else
      render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :username, :email, :password, :address_id)
  end

  def find_user
    @current_user = User.find(params[:id])
  end
end
