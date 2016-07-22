class StaticPagesController < ApplicationController
  def about
    @bike = current_user.bikes.first if current_user
  end

  def contact
    @bike = current_user.bikes.first if current_user
  end

  def letsencrypt
    render text: "vDP1BPuEsZ9mKRUXcVyxalh6EjFYC0hqp2JjvAmZMqI"
  end
end
