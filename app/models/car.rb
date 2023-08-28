class Car < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings

  validates :title, :brand, :year, :location, presence: true
end
