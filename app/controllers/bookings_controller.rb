class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :load_booking, except:[:index, :new, :create]
  load_and_authorize_resource
  def index
    @bookings = current_user.bookings
    @users = User.all
  end

  def create
    @booking = Booking.new(booking_params)
  end

  def show
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def edit
    @booking.destroy
    redirect_to(bookings_path)
  end

  private
  def booking_params
    params.require(:booking).permit(:user_id)
  end

  def load_booking
    @booking = Booking.find(params[:id])
  end
end
