module Puppi
  class Helper
    attr_reader :command, :action, :description

    def initialize args = {}
      @command     = args[:command]
      @action      = args[:action]
      @description = args[:description]
    end

  end

end
