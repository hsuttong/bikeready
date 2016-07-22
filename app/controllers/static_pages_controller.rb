class StaticPagesController < ApplicationController
  def about
    @bike = current_user.bikes.first if current_user
  end

  def contact
    @bike = current_user.bikes.first if current_user
  end

  def letsencrypt
    render text: "yudRvJVp5Cka32eolrcFvgOH2hR09mWbIncEv25uv7g.RV98dZ05CF_-rplnSvJQ8ZXqnTjsjEEj5L8LM76UiEM"
  end
end
