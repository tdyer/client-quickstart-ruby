require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

get '/hello-monkey' do
  puts "/hello-monkey: params = #{params}"
  people = {
    '+19789853901' => 'Tom Dyer',
    '+17868773064' => 'Carina Martinez'
  }

  name = people[params['From']] || 'Monkey'
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello #{name}"
    r.Play 'http://demo.twilio.com/hellomonkey/monkey.mp3'
    r.Gather :numDigits => '1', :action => '/hello-monkey/handle-gather', :method => 'get' do |g|
      g.Say 'To speak to a a real monkey, press 1.'
      g.Say 'Press any other key to start over'
    end
  end.text
end

get '/hello-monkey/handle-gather' do
  puts "/hello-monkey/handle-gather: params = #{params}"
  redirect '/hello-monkey' unless params['Digits'] == '1'
  Twilio::TwiML::Response.new do |r|
    puts '/hello-monkey/handle-gather: Dialing +13105551212'
    r.Dial '+13105551212' ### Connect the caller to Koko, or your cell
    r.Say 'The call failed or the remote party hung up. Goodbye.'
  end.text
end
