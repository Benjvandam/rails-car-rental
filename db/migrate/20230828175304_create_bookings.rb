class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :car, null: false, foreign_key: true
      t.float :price
      t.datetime :date_from
      t.datetime :date_until
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
