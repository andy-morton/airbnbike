class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
    @booking = Booking.new
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @user = current_user
    @bike.user = @user
    @bike.save

    redirect_to bikes_path(@bike)
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :description, :category, :size, :location, :price, :user_id, photos: [])
  end

end
