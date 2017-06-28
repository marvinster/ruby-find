require 'spec_helper.rb'
require_relative '../../server/find'
require 'awesome_print'
RSpec.describe "findserver doing ssl connection"  do
  subject{FindServer.new(1,2)}
  it 'should serve ssl on port 9999' do
    allow_any_instance_of(FindServer).to receive(:start_tls)
    expect(subject).to receive(:start_tls).with(any_args)
    subject.post_init()
  end
end

