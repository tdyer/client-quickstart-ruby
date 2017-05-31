require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

get '/' do
  'hello world! Currently running version: ' + Twilio::VERSION + ' of the twilio-ruby library'
end
