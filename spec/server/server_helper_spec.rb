require 'spec_helper.rb'
require_relative '../../server/find'
require 'awesome_print'

RSpec.describe "server helper methods" do
  subject{FindServer.new(1,2)}
  
  it "should renber haml" do
    #allow_any_instance_of(FindServer).to receive(:start_tls)
    #expect(File).to receive(:open)
    FindServer.render("GET Gemfile")
  end
end

