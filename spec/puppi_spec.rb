require "spec_helper"
require 'puppi'

describe "Puppi" do
  context "initial checks" do
    it "should provide puppidir path" do
      puppidir = Puppi::puppidir.should match(/(\/.+)+/)
    end
  
    it "should create puppi data directory if it does not exists" do
      File.exists?(Puppi::puppidir+'/data').should be_false
      Puppi::initial_checks
      File.exists?(Puppi::puppidir+'/data').should be_true
    end
  
    it "should create puppi helpers directory if it does not exists" do
      File.exists?(Puppi::puppidir+'/helpers').should be_false
      Puppi::initial_checks
      File.exists?(Puppi::puppidir+'/helpers').should be_true
    end
    
    it "should create puppi notifications directory if it does not exists" do
      File.exists?(Puppi::puppidir+'/notifications').should be_false
      Puppi::initial_checks
      File.exists?(Puppi::puppidir+'/notifications').should be_true
    end
  end
end