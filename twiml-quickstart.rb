require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

# Handle an incoming call is this app.

# When someone calls your Twilio number they should
# hear the phrase "Hello Monkey".

# Start this Sinatra web app listening on localhost:4567
# It will provide one endpoint /hello-monkey
# $ bundle exec ruby twiml-quickstart.rb

# Make this app reachable from outside the firewall.
# $ ngrok http 4567
# This will provide you with 2 URLs, http and https, that can accessed
# from outside you're internal network.
# Ex: https://9e118b7d.ngrok.io

# Go to your Twilio account console
# https://www.twilio.com/console
# Select "# Phone Numbers"
# https://www.twilio.com/console/phone-numbers/incoming
# Select "+1 978-291-7627"
# https://www.twilio.com/console/phone-numbers/PNe35730997bfaec8441f3363f0c7b20df
# Select the Configure Tab, if it's not already selected.
# In the Voice & Fax Section
# In the "A CALL COMES IN" textbox.
# ENTER the below URL, /hello-monkey with the domain name
# provided by ngrok above.
# Ex: https://9e118b7d.ngrok.io/hello-monkey
# Select GET from the drop-down to the right of this text box.
# SAVE (Don't forget to hit the save button!!!!)

# Make an incoming call from your phone to your twilio number
# 978 291-7627
# You'll hear a message to upgrade your account then a prompt to select
# any number.

# Select any number on your phone.
# You should hear the phrase "Hello Monkey"

get '/hello-monkey' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Hello Monkey'
  end.text
end

################################
# Look at the incoming call info.

# Select the Calls Log tab from the Phone Numbers page
# https://www.twilio.com/console/phone-numbers/instance/PNe35730997bfaec8441f3363f0c7b20df/calls
# Select Incoming from the drop-down below the Calls Log tab.
# This will show all the incoming calls to this number.
# It will show the Date/Time in Eastern Time, Direction (incoming), From and To numbers, etc.

# Select the incoming call from the list. This will show the Call SID, HTTP Request/Response
# etc.
