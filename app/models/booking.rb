class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  require 'date'

  validates :date_from, :date_until, presence: true
  # Car must be available for booking to happen - TBV
  validates :date_from, comparison: { greater_than: Date.today }
  validates :date_until, comparison: { greater_than: :date_from }
  validate :no_overlapping_bookings

  private

  def no_overlapping_bookings
    if Booking.where(car_id: car_id)
              .where.not(id: id) # Exclude the current booking when updating
              .where("(date_from <= ? AND date_until >= ?) OR (date_from >= ? AND date_from <= ?)", date_until, date_from, date_from, date_until)
              .exists?
      errors.add(:base, "Another booking already exists for this car during this period")
    end
  end
end
