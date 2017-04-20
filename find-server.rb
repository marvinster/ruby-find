#!/usr/bin/env ruby

$: << '.'
require 'app' 
require 'server/find'

EventMachine.run do
  EventMachine.start_server "localhost", 9999, FindServer
end
