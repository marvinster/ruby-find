require 'spec_helper.rb'
require_relative '../../server/find'
require 'awesome_print'
RSpec.describe "findserver doing ssl connection"  do
  before :all do
    # make connection object here outside event machine
    class EventMachine::Connection
      def new(one, two, *args)
      end
      def start_tls(*args)
      end
    end
  end
  subject{FindServer.new(1,2)}
  it 'should serve ssl on port 9999' do
    expect(subject).to receive(:start_tls).with(any_args)
    subject.post_init()
  end
end

