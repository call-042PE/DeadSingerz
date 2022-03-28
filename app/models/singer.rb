class Singer < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :name, presence: true
  validates :category, presence: true
  validates :price, presence: true
end
