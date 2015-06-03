require 'httparty'

class TasksController < ApplicationController

  skip_before_filter  :verify_authenticity_token  # Added this to prevent CSRF errors

  def index
  end

  def new
    p "tasks#new"
    @address = Address.new
    @bike = current_user.bikes.first
  end


  def create
    @task = Task.new(user_id:         current_user.id,
                     pickup_address:  "33 Montclair Terrace, San Francisco, CA 94109",
                     dropoff_address: "#{params[:street]},#{params[:city]}, #{params[:state]}, #{params[:zip_code]}",
                     status:          "initial" )
    if @task
      @task.save!
    end

    api = Postmates::Client.new

    #Get a Quote
    quote_response = api.create_delivery_quote( { dropoff_address: @task.dropoff_address, pickup_address: @task.pickup_address } )
    @task.quote_id = quote_response["id"]

    #Create a Delivery
    @user = User.find(current_user.id)
    @bike = @user.bikes.first

    pickup = "00:00:00"
    pickup_complete = "00:00:01"
    pickup_dropoff = "00:00:05"
    pickup_delivered = "00:00:45"

    delivery_hash = {
      manifest:             "#{@bike.color} #{@bike.make}",
      pickup_name:          "Bike Ready, Inc.",
      pickup_address:       @task.pickup_address,
      pickup_phone_number:  "415-555-1212",
      pickup_notes:         "Fragile",
      dropoff_name:         current_user.first_name,
      dropoff_address:      @task.dropoff_address,
      dropoff_phone_number: current_user.phone,
      quote_id:             @task.quote_id,
      robo_pickup:          pickup,
      robo_pickup_complete: pickup_complete,
      robo_dropoff:         pickup_dropoff,
      robo_delivered:       pickup_delivered
    }


    delivery_response = api.create_delivery(delivery_hash)

    @task.delivery_id = delivery_response["id"]
    @task.dropoff_lat_lng = JSON.generate(delivery_response["dropoff"]["location"])
    @task.pickup_lat_lng = JSON.generate(delivery_response["pickup"]["location"])
    @task.status = delivery_response["status"]

    @task.save!
    @bike.status = @task.status
    @bike.save!

    redirect_to '/'
  end

  def status_update
    @bike = current_user.bikes.first

    api = Postmates::Client.new

    if( @bike && @bike.status != "storage" &&  @bike.status != "delivered")
      @task = Task.where(user_id: current_user.id).last

      del_status_response = api.delivery_status(@task.delivery_id)
      if del_status_response["status"] != @task.status
        @task.status = del_status_response["status"]
        @bike.status = @task.status
        @task.save!
        @bike.save!
      end

      account_sid  = ENV['TWILIO_ACCOUNTSID_PROD']
      auth_token = ENV['TWILIO_AUTH_TOKEN_PROD']

      # set up a client to talk to the Twilio REST API
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      if (del_status_response.parsed_response["status"] == "delivered")
        @message = @client.account.messages.create({:to => "+1#{current_user.phone}", :from => "+16502354317", :body => "Test"})
      end

      render :json => {status: @task.status}

    else
      render :json => {:message => "error"}
    end
  end

  def pickup_conf
    p "tasks#pickup_conf"
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
