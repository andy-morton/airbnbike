class BikesController < ApplicationController
def show
  @bike = Bike.find(params[:id])
end

private
def list_params
  params.require(:bike).permit(:name)
end
end
