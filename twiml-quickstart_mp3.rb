require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

get '/hello-monkey' do
  people = {
    '+19789853901' => 'Tom Dyer',
    '+17868773064' => 'Carina Martinez'
  }

  name = people[params['From']] || 'Monkey'
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello #{name}"
    r.Play 'http://demo.twilio.com/hellomonkey/monkey.mp3'
  end.text
end
