class Booking < ApplicationRecord
  belongs_to :singer_id, :user_id
  validates :date, presence: true
end
