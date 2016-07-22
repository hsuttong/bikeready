class StaticPagesController < ApplicationController
  def about
    @bike = current_user.bikes.first if current_user
  end

  def contact
    @bike = current_user.bikes.first if current_user
  end

  def letsencrypt
    render plain: "S15NaOZsX-K7qWl6vlbYMlprnsKumKKbmV8Iu_Y3qos"
  end
end
