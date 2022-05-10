class BookingsController < ApplicationController
def new
  @bike = Bike.find(params[:bike_id])
  @booking = Booking.new
end

def create
  @booking = Booking.new(booking_params)
  @bike = Bike.find(params[:bike_id])
  @booking.bike = @bike
  @booking.save
  redirect_to bike_path(@bike)
end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end
end
