class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  # validates :price, :date_from, :date_until, presence: true
  # validates :date_from, comparison: { greater_than: :date_until }
end
