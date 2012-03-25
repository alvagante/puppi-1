require "spec_helper"
require 'puppi'

describe "Puppi::Notification" do
  
  before(:each) do
    @loader = Puppi::Loader.new
  end

  it "should show raise exception when a unknown method is specified" do
    expect { Puppi::Notification.new(['unknown'], 'output') }.to raise_error(RuntimeError)
  end
  
  it "should not show a error message when a unknown method is specified" do
    Puppi::Notification.new(['mail'], 'output').should be_true
  end
  
  context "using a methods specified on CLI" do
    it "should use the specified one" do
      Puppi::Notification.new(['mail'], 'output')
    end
  end
  
  context "using a default notification specified on helper file" do
  end
  
  context "printing to stdout" do
  end
end