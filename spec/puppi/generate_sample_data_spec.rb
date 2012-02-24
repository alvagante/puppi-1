require "spec_helper"
require 'puppi'
require 'fileutils'

describe "Puppi::GenerateSampleData" do
  
  before(:each) do
    Puppi::initial_checks
    Puppi::GenerateSampleData.new.helpers
    Puppi::GenerateSampleData.new.datafiles
  end

  it "should the standard helper" do
    standard_helper = File.open(Puppi::puppidir+'/helpers/standard.yml', 'rb') { |file| file.read }
    standard_helper.should eql '--- 
:info: 
  -
    :command: echo "+ %{name} +"
    :description: "info module name for tests"
:check:
  -
    :command: echo "| %{name} |"
    :description: "check module name for tests"
  -
    :command: echo "| %{version} |"
    :description: "check module version"'
  end
  
  it "should the standard datafile for openssh module" do
    standard_helper = File.open(Puppi::puppidir+'/data/standard_openssh.yml', 'rb') { |file| file.read }
    standard_helper.should eql '--- 
name: openssh
version: 1.0'
  end
  
  it "should the standard datafile for hostname module" do
    standard_helper = File.open(Puppi::puppidir+'/data/standard_hostname.yml', 'rb') { |file| file.read }
    standard_helper.should eql '--- 
name: hostname'
  end
end