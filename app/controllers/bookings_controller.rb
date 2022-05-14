class BookingsController < ApplicationController

  def new
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.user = current_user
    @booking.save
    redirect_to bike_path(@bike)
  end

  def show
      @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    @user = current_user

    redirect_to user_path(@user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :bike_id)
  end
end
