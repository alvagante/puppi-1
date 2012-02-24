module Puppi
  class Helper
    attr_reader :command, :description

    def initialize args = {}
      @command     = args[:command]
      @description = args[:description]
    end

  end

end
