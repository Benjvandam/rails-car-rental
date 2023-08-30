class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show]
  skip_before_action :authenticate_user!, only: [:show, :index]
  # def index
  #   @reviews = review.all
  # end

  def show
    @review = Review.new
    @review = review.find(params[:id])
    @review.user = current_user
  end

  def new
    @car = Car.find(params[:car_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @car = Car.find(params[:car_id])
    @review.user = current_user
    @review.car = @car
    if @review.save
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

  def set_review
    @review = review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
