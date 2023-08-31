class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :price, :date_from, :date_until, presence: true
  # Car must be available for booking to happen - TBV
  # Cant rent for pas date - TBV
  # validates :date_from, comparison: { greater_than: :date.now }
  validates :date_until, comparison: { greater_than: :date_from }
end
