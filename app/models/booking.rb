class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  # validates :price, :date_from, :date_until, presence: true
  # car need to be from the owner
  # car must be available for booking to happen
  # validates :date_from, comparison: { greater_than: :date_until }
end
