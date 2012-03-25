require 'mail'

module Puppi
  module Notifications
    class Mail
      def initialize
        @loader = Puppi::Loader.new
      end
      
      def output(output)
        @@output = output
        mails = load_all
        mails.each do |mail|
          mailer = @loader.load_notification(mail)
          send_mail (mailer) if valid_mailer? (mailer)
        end
      end
      
      private
      def send_mail (mail)
        mail = ::Mail.new do
                  from    mail.variables[:from]
                  to      mail.variables[:to]
                  subject mail.variables[:subject]
                  body    @@output
        end
        mail.deliver!
      end
      
      def valid_mailer? (mailer)
        required_fields = %w[ from to subject method ]
        required_fields.each do |required_field|
          return false if mailer.variables.include? required_field
        end
        return true
      end
      
      def load_all
        @loader.load_all('notifications', 'mail')
      end
    end
  end
end
    