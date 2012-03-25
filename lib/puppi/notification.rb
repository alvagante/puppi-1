module Puppi
  class Notification
    
    def initialize(notifications, output)
      if notifications.empty?
        to_stdout output
        return
      end
      @loader = Puppi::Loader.new
      validate_notifications_methods notifications
      notifications.each do |notification|
        notifier = Puppi::Notifications.class_eval(notification.capitalize).new
        notifier.output(output) if notifier.respond_to? 'output'
      end
    end
    
    def validate_notifications_methods (notifications)
      notifications.each do |notification|
        if !valid_method? notification
          raise "unknown notification method"
        end
      end
    end
    
    private
    def valid_method? (method)
      @valid_methods = Puppi::Notifications.constants.select {|c| Class === Puppi::Notifications.const_get(c)}
      @valid_methods.include? method.capitalize.to_sym
    end
    
    def to_stdout (output)
      puts output
    end
  end
end