class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @bike = current_user.bikes.first
  end

end
