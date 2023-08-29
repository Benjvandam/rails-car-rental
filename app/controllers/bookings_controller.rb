class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit create destroy]
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
    @booking = booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:car).permit(:car_id, :price, :date_from, :date_until, :user_id)
  end

  def update_booking_params
    params.require(:car).permit(:date_from, :date_until)
  end
end
