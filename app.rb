require 'eventmachine'
require 'em-http'
require 'fiber'
require 'active_record'
require 'pry'
#require 'prettyprint'
if(/rspec$/ =~ $0)
  
  ActiveRecord::Base.establish_connection(
    :adapter  => 'postgresql',
    :database => 'search',
    :username => 'pavel',
    :host     => '/tmp')
else
  ActiveRecord::Base.establish_connection(
    :adapter  => 'postgresql',
    :database => 'search',
    :username => 'pavel',
    :host     => '192.168.1.251',
    :password => '321water')

end


$LOAD_PATH << "."
Dir["models/*.rb"].each {|file| require file }
