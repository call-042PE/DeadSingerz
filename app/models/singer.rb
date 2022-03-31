class Singer < ApplicationRecord
  belongs_to :user
  has_many :ratings
  validates :name, presence: true
  has_one_attached :photo
end
