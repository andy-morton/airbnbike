class BikesController < ApplicationController
  def index
    @bikes = Bike.all
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        info_window: render_to_string(partial: "info_window", locals: { bike: bike })
        # image_url: helpers.asset_url(Cloudinary::Utils.cloudinary_url(bike.photos.first.key))
      }
    end
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
