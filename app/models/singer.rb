class Singer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :category, presence: true
  validates :price, presence: true
end
