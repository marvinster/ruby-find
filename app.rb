require 'eventmachine'
require 'em-http'
require 'fiber'
require 'active_record'
require 'pry'
#require 'prettyprint'

ActiveRecord::Base.establish_connection(
  :adapter  => 'postgresql',
  :database => 'search',
  :username => 'pavel',
  :host     => '/tmp')


$LOAD_PATH << "."
Dir["models/*.rb"].each {|file| require file }
