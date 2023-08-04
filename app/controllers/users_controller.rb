class UsersController < ApplicationController
  def index
    users = User.order('created_at DESC')
    render json: {status_code: 'SUCCESS', message:'Users Loaded', data:users},status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: {status: 'SUCCESS', message:'User Found', data:user},status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {status: 'SUCCESS', message:'User Created', data:user},status: :ok
    else
      render json: {status: 'ERROR', message:'User Not Created', data:user.errors},status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {status: 'SUCCESS', message:'User Deleted', data:user},status: :ok
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: {status: 'SUCCESS', message:'User Updated', data:user},status: :ok
    else
      render json: {status: 'ERROR', message:'User Not Updated', data:user.errors},status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :age, :gender)
  end
end
