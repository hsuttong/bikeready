class StaticPagesController < ApplicationController
  def about
    @bike = current_user.bikes.first if current_user
  end

  def contact
    @bike = current_user.bikes.first if current_user
  end

  def letsencrypt
    render text: "RSbQJiES98TmfzqfRwN36Rn_7-4cm_BmZJahxx83gV8.RV98dZ05CF_-rplnSvJQ8ZXqnTjsjEEj5L8LM76UiEM"
  end
end
