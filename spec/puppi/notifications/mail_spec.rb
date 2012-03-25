require "spec_helper"
require 'puppi'


describe "Puppi::Notifications::Mail" do
  include Mail::Matchers
    
  before(:all) do
    Puppi::initial_checks
    @generator = Puppi::GenerateSampleData.new
    @generator.helpers
    @generator.datafiles
    @generator.notifications
    Mail::TestMailer.deliveries.clear
    mailer = Puppi::Notifications::Mail.new
    mailer.output('puppi notification body')
  end
  
  it { should have_sent_email }
  it { should have_sent_email.from('puppi@puppi.com') }
  it { should have_sent_email.to('user1@mail.com').with_subject('[puppi] notification').with_body('puppi notification body') }
  it { should have_sent_email.to('user2@mail.com').with_subject('[puppi] notification').with_body('puppi notification body') }

  it "should return invalid mailer when its not a Puppi::Files::Notification class" do
    Puppi::Notifications::Mail.publicize_methods do
      Puppi::Notifications::Mail.new.valid_mailer?(false).should be_false
    end
  end
  
  context "working with invalid mailer" do
    before(:each) do
      @hash = {"from"=>"puppi@puppi.com", "to"=>"user1@mail.com", "subject"=>"[puppi] notification"}
    end
    it "should return invalid when field 'to' is missing" do
      Puppi::Notifications::Mail.publicize_methods do
        @hash.delete('to')
        notification = Puppi::Files::Notification.new(@hash)
        Puppi::Notifications::Mail.new.valid_mailer?(notification).should be_false
      end
    end
    
    it "should return invalid when field 'from' is missing" do
      Puppi::Notifications::Mail.publicize_methods do
        @hash.delete('from')
        notification = Puppi::Files::Notification.new(@hash)
        Puppi::Notifications::Mail.new.valid_mailer?(notification).should be_false
      end
    end
    
    it "should return invalid when field 'subject' is missing" do
      Puppi::Notifications::Mail.publicize_methods do
        @hash.delete('subject')
        notification = Puppi::Files::Notification.new(@hash)
        Puppi::Notifications::Mail.new.valid_mailer?(notification).should be_false
      end
    end
  end
end