class ChangeDateUntilToBeDateInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :date_until, :date
  end
end
