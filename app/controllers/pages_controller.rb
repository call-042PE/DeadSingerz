class PagesController < ApplicationController
  def home
    @singers = Singer.all
  end

  def dashboard
    @singer = Singer.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end
end
