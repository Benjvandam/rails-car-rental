class UsersController < ApplicationController
  def my_cars
    @cars = current_user.cars
  end

  def show
    @user = current_user
    # You can customize this action to display the user's information and other related data.
  end
end
