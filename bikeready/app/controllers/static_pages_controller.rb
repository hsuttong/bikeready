class StaticPagesController < ApplicationController
  def about
     @bike = current_user.bikes.first
  end

  def contact
     @bike = current_user.bikes.first
  end
end
