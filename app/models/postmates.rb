module Postmates

  class Client
    include HTTParty

    KEY  = ENV['POSTMATES_API_KEY']
    USER = ENV['POSTMATES_CUSTOMER_ID']
    HOST = ENV['POSTMATES_HOST']
    PATH = "/v1/customers/#{USER}"


# API Notes:
# Request a Delivery quote
# POST /v1/customers/:customer_id/delivery_quotes

# Create a Delivery
# POST /v1/customers/:customer_id/deliveries

# Poll your newly created delivery to follow the status of your delivery
# GET /v1/customers/:customer_id/deliveries/:delivery_id

    def initialize
    end

    def create_delivery_quote(dropoff_pickup_hash)
      @quote_response ||= post('/delivery_quotes', dropoff_pickup_hash)  
    end


    def create_delivery(delivery_hash)
      @delivery_response ||= post('/deliveries', delivery_hash)  
    end

    def delivery_status(delivery_id)
      get("deliveries/#{delivery_id}")
      #@del_status ||= get("deliveries/#{delivery_id}") #not getting updated status with this assignment
    end


    private

    def post(end_point, params={})
      url = "#{HOST}#{PATH}#{end_point}"
      options = { basic_auth: {username: KEY},
                  body:       params
                }
      HTTParty.post(url, options)
    end

    def get(end_point, params={})
      url = "#{HOST}#{PATH}/#{end_point}"
      options = { basic_auth: {username: KEY},
                  body:       params
                }

      HTTParty.get(url, options) 
    end
  end
end
