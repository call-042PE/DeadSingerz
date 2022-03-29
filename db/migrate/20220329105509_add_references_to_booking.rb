class AddReferencesToBooking < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :user_id
    remove_column :bookings, :singer_id
    add_reference :bookings, :user_id, index: true
    add_reference :bookings, :singer_id, index: true
  end
end
