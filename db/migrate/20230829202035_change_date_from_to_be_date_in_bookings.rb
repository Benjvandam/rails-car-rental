class ChangeDateFromToBeDateInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :date_from, :date
  end
end
