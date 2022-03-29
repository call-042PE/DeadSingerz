class Booking < ApplicationRecord
  belongs_to :singer
  belongs_to :user
  validates :date, presence: true
end
