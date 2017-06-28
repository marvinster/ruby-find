require 'spec_helper.rb'
require_relative '../../server/find'
require 'awesome_print'
RSpec.describe "findserver doing ssl connection"  do
  before :all do
    # make connection object here outside event machine
    
  end
  it 'should serve ssl on port 9999' do
    expect(subject).to receive(:start_tls).with(any_args)
    EventMachine.run do
      EventMachine.add_timer(2){ EventMachine.stop_server }
      EventMachine.start_server 'ldev.arslogi.ca',10000,FindServer
    end
  end
end

