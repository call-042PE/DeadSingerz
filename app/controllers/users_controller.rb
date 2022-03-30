class UsersController < ApplicationController
  def index
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
  end

  def show
    @user = User.find(params[:id])
  end
end
