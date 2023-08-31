class UsersController < ApplicationController
  def myCars
    @cars = current_user.cars
  end
end
