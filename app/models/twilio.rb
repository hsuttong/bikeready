require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid  = ENV['TWILIO_ACCOUNTSID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@message = @client.account.messages.create({:to => "+15102208405", :from => "+16504092984", :body => "Test"})

