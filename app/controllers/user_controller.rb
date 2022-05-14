class UserController < ApplicationController
  def show
    @bookings = current_user.bookings
    @bikes = current_user.bikes
  end
end
