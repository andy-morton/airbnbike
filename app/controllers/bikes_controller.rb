class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def home
    @bikes = Bike.all
  end
end
