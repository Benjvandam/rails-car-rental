class RemovePriceFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :price
  end
end
