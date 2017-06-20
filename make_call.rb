require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here - from twilio.com/user/account
account_sid = 'AC499544b4f8fea886d0e1d219487fa9f2'
auth_token = 'd9bc0cb564570ecf87e18e78329db801'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@call = @client.account.calls.create(
  :from => '+19782917627',   # From your Twilio number
  :to => '+19789853901',     # To any number
  # Fetch instructions from this URL when the call connects
  :url => 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient'
)
