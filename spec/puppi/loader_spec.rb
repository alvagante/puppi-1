require "spec_helper"
require 'puppi'

describe "Puppi::Loader" do
  
  before(:each) do
    @loader = Puppi::Loader.new
  end
  
  context "loading helpers" do
     before(:each) do
       Puppi::initial_checks
       Puppi::GenerateSampleData.new.helpers
     end
   
     it "should load all helpers files" do
       @helperfiles = @loader.load_all('helpers')
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
      @datafiles = @loader.load_all('data')
      @datafiles.should be_a(Array)
      @datafiles.should have(2).items
    end
    
    it "should load all hostname data files" do
      @datafiles = @loader.load_all('data', 'hostname')
      @datafiles.should be_a(Array)
      @datafiles.should have(1).items
    end
  
    it "should load all openssh standard data file" do
      @p = @loader.load_datafile('standard_openssh')
      @p.should be_a(Puppi::Files::Datafile)
      @p.variables.should have(2).items
    end
  
    it "should load all hostname standard data file" do
      @p = @loader.load_datafile('standard_hostname')
      @p.should be_a(Puppi::Files::Datafile)
      @p.variables.should have(1).items
    end
  
    it "should raise an exception for a invalid data file" do
      expect { @loader.load_datafile('invalid_datafile') }.to raise_error("Invalid Datafile")
    end
  end

  context "loading notification files" do
    before(:each) do
     Puppi::initial_checks
     Puppi::GenerateSampleData.new.notifications
    end

    it "should load all notification files" do
      @notifications = @loader.load_all('notifications')
      @notifications.should be_a(Array)
      @notifications.should have(2).items
    end
    
    it "should load all notification files for mail method" do
      @notifications = @loader.load_all('notifications', 'mail')
      @notifications.should be_a(Array)
      @notifications.should have(2).items
    end
  
    it "should load all mail notification files" do
      @p = @loader.load_notification('mail_user1')
      @p.should be_a(Puppi::Files::Notification)
      @p.variables.should have(3).items
    end
  
    it "should raise an exception for a invalid notification file" do
      expect { @loader.load_notification('notification_invalid') }.to raise_error("Invalid Notification")
    end
  end
end