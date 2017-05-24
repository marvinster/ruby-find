#!/usr/bin/env ruby

$: << '.'
require 'app' 
require 'server/find'

EventMachine.run do
  EventMachine.start_server "ldev.arslogi.ca", 9999, FindServer
end
