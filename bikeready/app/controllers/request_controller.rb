class RequestController < ApplicationController
  def index
    #@user = User.find(params[:id])
    @user = User.find(1)
    @bike = @user.bikes.first
  end


  def deliver_conf
    
  end

  def pickup_conf
  end

end
