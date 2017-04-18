#!/usr/bin/env ruby


require 'app' 

def async_fetch(url)
  f = Fiber.current
  http = EventMachine::HttpRequest.new(url).get :timeout => 10
  http.callback { f.resume(http) }
  http.errback { f.resume(http) }

  return Fiber.yield
end

EventMachine.run do
  Fiber.new{
    puts "Setting up HTTP request #1"
    data = async_fetch('https://www.google.ru/')
    puts "Fetched page #1: #{data.response_header.status}"

    EventMachine.stop
  }.resume
end
