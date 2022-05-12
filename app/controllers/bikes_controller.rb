class BikesController < ApplicationController
def show
  @bike = Bike.find(params[:id])
  @booking = Booking.new
  console
end

private
def list_params
  params.require(:bike).permit(:name, :description, :location, :price, :user_id)
end
end
