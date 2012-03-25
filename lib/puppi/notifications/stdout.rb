module Puppi
  module Notifications
    class Stdout
      def initialize
      end
      
      def output(output)
        puts output
      end
    end
  end
end
