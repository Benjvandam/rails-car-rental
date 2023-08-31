class UsersController < ApplicationController
  def myCars
    @cars = current_user.cars
  end

  def show
    @user = current_user
    # You can customize this action to display the user's information and other related data.
  end
end
