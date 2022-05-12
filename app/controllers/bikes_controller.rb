class BikesController < ApplicationController

def index
    @bikes = Bike.all
  end

def show
  @bike = Bike.find(params[:id])
  @booking = Booking.new
end

private
def list_params
  params.require(:bike).permit(:name, :description, :location, :price, :user_id)
end

end
