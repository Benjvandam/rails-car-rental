class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def myCars
    @cars = current_user.cars
  end

  def show
    # You can customize this action to display the user's information and other related data.
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
