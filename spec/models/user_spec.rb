require 'spec_helper'

RSpec.describe User do
  subject { build(:user) }
  before :all do
  end
  it "should have and email that contains an at sign" do
    expect(subject.email).to match(/@/)
  end
  
  it "should be fabulous" do
    expect(subject.valid?).to be(true)
    true
  end
end

