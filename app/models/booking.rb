class Booking < ApplicationRecord
  belongs_to :singer_id
  belongs_to :user_id
  # validates :date, presence: true
end
