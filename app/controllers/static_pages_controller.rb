class StaticPagesController < ApplicationController
  def about
    @bike = current_user.bikes.first if current_user
  end

  def contact
    @bike = current_user.bikes.first if current_user
  end

  def letsencrypt
    render text: "FgbhZkXqCMyebc-ucVjnP8s3gGhmE4_Hu9gnwPpZdcE"
  end
end
