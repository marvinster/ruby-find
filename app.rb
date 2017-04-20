require 'eventmachine'
require 'em-http'
require 'fiber'
require 'active_record'
require 'pry'
#require 'prettyprint'
if(ENV['IN_DOCKER'] == 'yes')
  ActiveRecord::Base.establish_connection(
    :adapter  => 'postgresql',
    :database => 'search',
    :username => ENV['DBUSER'],
    :host     => '192.168.1.251',
    :password => ENV['DBPASSWORD'])
else

  ActiveRecord::Base.establish_connection(
    :adapter  => 'postgresql',
    :database => 'search',
    :username => 'pavel',
    :host     => '/tmp')
end


$LOAD_PATH << "."
Dir["models/*.rb"].each {|file| require file }
