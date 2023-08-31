class CarsController < ApplicationController
  before_action :set_car, only: %i[show]
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @cars = Car.all
  end

  def show
    @review = Review.new
    @car = Car.find(params[:id])
    @review.user = current_user
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:title, :brand, :model, :year, :description, :location, photos: [])
  end
end
