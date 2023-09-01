class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @cars = Car.all
  end

  def show
    @reviews = @car.reviews
    @car = Car.find(params[:id])
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      current_user.owner = true
      current_user.save
      redirect_to garage_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      current_user.owner = true
      current_user.save
      redirect_to garage_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to garage_path
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:title, :price, :brand, :model, :year, :description, :location, photos: [])
  end
end
