require 'httparty'

class TasksController < ApplicationController

  skip_before_filter  :verify_authenticity_token  # Added this to prevent CSRF errors

  include HTTParty

  def index
  end

  def new
    p "tasks#new"
    @address = Address.new
  end


  def create
    # Need to define a relationship between this address and task? can't storey addresses like this in the db.
    # @address = Address.new(street:   params[:street],
    #                        city:     params[:city],
    #                        state:    params[:state],
    #                        zip_code: params[:zip_code],
    #                        user_id:  current_user.id )

    @task = Task.new(user_id:         current_user.id,
                     pickup_address:  "33 Montclair Terrace, San Francisco, CA 94109",
                     dropoff_address: "#{params[:street]},#{params[:city]}, #{params[:state]}, #{params[:zip_code]}",
                     status:          "initial" )
    if @task
      @task.save!
    end

    api = Postmates::Client.new
    quote_response = api.create_delivery_quote( { dropoff_address: @task.dropoff_address, pickup_address: @task.pickup_address } )
    @task.quote_id = quote_response["id"]

    delivery_hash = {
      manifest: '#{current_user.bike.color} #{current_user.bike.make}',
      pickup_name: 'Bike Ready, Inc.',
      pickup_address: @task.pickup_address,
      pickup_phone_number: '415-555-1212',
      pickup_notes: 'Fragile',
      dropoff_name: current_user.first_name,
      dropoff_address: @task.dropoff_address,
      dropoff_phone_number: current_user.phone,
      quote_id: @task.quote_id
    }

    delivery_response = api.create_delivery(delivery_hash)

    @task.delivery_id = delivery_response["id"]
    @task.status = delivery_response["status"]
    @user = User.find(current_user.id)
    @bike = @user.bikes.first
    @bike.status = @task.status
    @bike.save!
    @task.save!


    redirect_to '/'
  end

  def pickup_conf
    p "tasks#pickup_conf"
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end