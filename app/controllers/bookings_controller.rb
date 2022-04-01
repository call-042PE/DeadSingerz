class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :load_booking, except: %i[index new create userbookings waitingbookings]

  def index
    @bookings = Booking.where(booked: false)
  end

  def create
    already_booked = false
    @bookings_booked = Booking.where(date: params[:booking][:date])
    if @bookings_booked.empty?
      @booking = Booking.new(booking_params)
      @booking.booked = false
      if @booking.save
        redirect_to "/dashboard"
      else
        redirect_to "/singers/"
      end
    else # if the array is not empty it means that someone booked some artist on the same day
      @bookings_booked.each do |booking|
        @booking = Booking.new(booking_params)
        already_booked = true if @booking.singer.name == booking.singer.name
      end
      unless already_booked
        @booking.booked = false
        if @booking.save
          redirect_to "/dashboard"
        else
          redirect_to "/singers/"
        end
      end
    end
  end

  def update
    @singer = Singer.find(params[:singer_id])
    @booking = Booking.find(params[:id])
    if current_user.id == @singer.user_id
      @booking.update(booked: true)
      @singer.save
    end
  end

  def destroy
    @singer = Singer.find(params[:singer_id])
    @booking = Booking.find(params[:id])
    if current_user.id == @singer.user_id
      @booking.delete
      @singer.save
    end
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

  # custom api method routes

  def userbookings
    @bookings = Booking.where(user_id: current_user.id, booked: true)
    render json: @bookings
  end

  def waitingbookings
    @bookings = Booking.where(user_id: current_user.id, booked: false)
    render json: @bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :singer_id, :date)
  end

  def load_booking
    @booking = Booking.find(params[:id])
  end
end
