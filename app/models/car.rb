class Car < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings
  has_one_attached :photo

  validates :title, :brand, :year, :location, presence: true

  def self.review_avarage(car)
    sum = 0.0
    car.reviews.each do |review|
      sum += review.rating
    end
    sum / car.reviews.length
  end
end
