class PagesController < ApplicationController
  def home
  end

  def dashboard
    @singer = Singer.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end
end
