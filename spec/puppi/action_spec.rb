require "spec_helper"
require 'puppi'

describe "Puppi::Action" do
  
  before(:each) do
    Puppi::initial_checks
    Puppi::GenerateSampleData.new.helpers
    Puppi::GenerateSampleData.new.datafiles
  end
        
  it "should respond to check action" do
    Puppi::Action.new(:check, nil).should respond_to(:execute).with(1).argument
  end
  
  it "should respond to log action" do
    Puppi::Action.new(:log, nil).should respond_to(:execute).with(1).argument
  end
  
  it "should respond to info action" do
    Puppi::Action.new(:info, nil).should respond_to(:execute).with(1).argument
  end
  
  it "should not respond to an unknown action" do
    expect { Puppi::Action.new(:unknown_action, nil) }.to raise_error "No Action Found"
  end
  
  it "should return module name if puppi module is specified" do
    Puppi::Action.new(:check, :openssh).puppi_module.to_s.should match(/openssh/)
  end
  
  it "should return nil as module name name if no puppi module is specified" do
    Puppi::Action.new(:check, nil).puppi_module.should be_a(NilClass)
  end
  
  it "should return all command output when running info command" do
    output = Puppi::Action.new(:info, nil).output
    output.should be_an(Array)
    output.should have(2).items
    output.should include("+ hostname +\n")
    output.should include("+ openssh +\n")
  end
  
  it "should return all command output when running check command" do
    output = Puppi::Action.new(:check, nil).output
    output.should be_an(Array)
    output.should have(4).items
    output.should include("| hostname |\n")
    output.should include(nil)
    output.should include("| openssh |\n")
    output.should include("| 1.0 |\n")
  end
end