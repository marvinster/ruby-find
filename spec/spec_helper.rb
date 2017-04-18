require_relative '../app'
require 'factory_girl'
require 'faker'

ActiveRecord::Base.establish_connection(
  :adapter  => 'postgresql',
  :database => 'search',
  :username => 'pavel',
  :host     => '/tmp')

RSpec.configure do |config|
  
  config.include FactoryGirl::Syntax::Methods

  FactoryGirl.define do
    Dir['factories/*.rb'].each do |file|
      require file 
    end
  end
  
  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end
