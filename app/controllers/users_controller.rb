class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

  def index
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
    @bookings_waiting = Booking.where(booked: false)
    @singers = Singer.where(user_id: @user.id)
  end

  def show
    @user = User.find(params[:id])
    raise
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :image_url, :photo, :price, :bio, :death_year)
  end
end
