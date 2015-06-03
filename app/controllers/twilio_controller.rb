require 'twilio-ruby'

class SendTextController < ApplicationController
  def index
  end

  def send_text_message
    number_to_send_to = params[:number_to_send_to]

    twilio_sid  = ENV['TWILIO_ACCOUNTSID']
    twilio_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_phone_number = "16504092984"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "This is an message. It gets sent to #{number_to_send_to}"
    )
  end
end
