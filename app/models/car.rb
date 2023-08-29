class Car < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings
  has_one_attached :photo

  validates :title, :brand, :year, :location, presence: true
end
