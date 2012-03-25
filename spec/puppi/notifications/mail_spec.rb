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

end