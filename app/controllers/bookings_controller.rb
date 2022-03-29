class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :load_booking, except:[ :index, :new, :create ]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.booked = false
    @booking.save
  end

  def show
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
    @singer = Singer.find(params[:singer_id])
  end

  def edit
    @booking.destroy
    redirect_to(bookings_path)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :singer_id, :date)
  end

  def load_booking
    @booking = Booking.find(params[:id])
  end
end
