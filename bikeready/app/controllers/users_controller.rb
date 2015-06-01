class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @bike = current_user.bikes.first

    #get bike status
    if (@bike.status != 'with_user' && @bike.status != 'delivered')
      api = Postmates::Client.new
      @task = Task.where(user_id: current_user.id).last
      del_status_response = api.delivery_status(@task.delivery_id)
      @bike.status = del_status_response["status"]
      @bike.save!
    end
  end
end
