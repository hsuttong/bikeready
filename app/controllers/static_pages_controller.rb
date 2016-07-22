class StaticPagesController < ApplicationController
  def about
    @bike = current_user.bikes.first if current_user
  end

  def contact
    @bike = current_user.bikes.first if current_user
  end

  def letsencrypt
    render text: "uO57GuySTZEayNRGW0MXjwVJOtA9z3o-4YZFnIJ6NCg"
  end
end
