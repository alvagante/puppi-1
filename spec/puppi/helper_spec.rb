require "spec_helper"
require 'puppi'
require 'fileutils'

describe "Puppi::Helper" do
  
  before(:each) do
    Puppi::initial_checks
    Puppi::GenerateSampleData.new.helpers
    #Puppi::GenerateSampleData.new.datafiles
  end

  it "should return a array with all helpers" do
    #Dir.glob(Puppi::puppidir+'/helpers/*.yml')
  end
end