class BikesController < ApplicationController

  def index
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike.save
    redirect_to '/'
  end

end
