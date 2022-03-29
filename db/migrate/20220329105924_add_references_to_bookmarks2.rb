class AddReferencesToBookmarks2 < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :user_id_id
    remove_column :bookings, :singer_id_id
    add_reference :bookings, :user, index: true
    add_reference :bookings, :singer, index: true
  end
end
