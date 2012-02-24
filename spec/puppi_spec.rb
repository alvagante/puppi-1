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
  end
  
  context "loading helpers" do
     before(:each) do
       Puppi::initial_checks
       Puppi::GenerateSampleData.new.helpers
     end
     
     it "should load all helpers files" do
       @helperfiles = Puppi::all_helpers
       @helperfiles.should be_a(Array)
       @helperfiles.should have(1).items
       @helperfiles.should include('standard')
    end
  end
  
  context "loading data files" do
    before(:each) do
     Puppi::initial_checks
     Puppi::GenerateSampleData.new.datafiles
    end

    it "should load all data files" do
      @datafiles = Puppi::all_datafiles
      @datafiles.should be_a(Array)
      @datafiles.should have(2).items
    end
    
    it "should load all openssh standard data file" do
      @p = Puppi::load_datafile('standard_openssh')
      @p.should be_a(Puppi::Datafile)
      @p.variables.should have(2).items
    end
    
    it "should load all hostname standard data file" do
      @p = Puppi::load_datafile('standard_hostname')
      @p.should be_a(Puppi::Datafile)
      @p.variables.should have(1).items
    end
    
    it "should raise an exception for a invalid data file" do
      expect { Puppi::load_datafile('invalid_datafile') }.to raise_error("Invalid Datafile")
    end
  end
end