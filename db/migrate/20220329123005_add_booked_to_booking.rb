class AddBookedToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :booked, :boolean
  end
end
