class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]

  def index
    @bookings = Booking.all
  end

  def update
    @booking.update(update_booking_params)
    redirect_to bookings_path
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render 'cars/show', status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:car_id, :price, :date_from, :date_until, :user_id)
  end

  def update_booking_params
    params.require(:booking).permit(:date_from, :date_until)
  end
end
