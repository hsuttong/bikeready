require 'httparty'

KEY = ENV['POSTMATES_API_KEY']
USER = ENV['POSTMATES_CUSTOMER_ID']
HOST = ENV['POSTMATES_HOST']

class TasksController < ApplicationController
  include HTTParty

  def index
  end

  def new
    #binding.pry
    @address = Address.new(city: params[:city],
                          state: params[:state],
                          street: params[:street],
                          zip_code: params[:zip_code],
                          user_id: 1)

  end

  def pickup_conf
    p "today is a good day"
  end

  def show
    #@user = User.find(params[:id])
    @user = User.find(1)
    @bike = @user.bikes.first
  end
end
