class Car < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :title, :brand, :year, :location, presence: true

  def self.review_avarage(car)
    sum = 0.0
    car.reviews.each do |review|
      sum += review.rating
    end
    sum / car.reviews.length
  end
end
