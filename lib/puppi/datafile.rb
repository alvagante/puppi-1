module Puppi
  class Datafile
    attr_reader :variables
    
    def initialize args = {}
      @variables = args
      @var = Hash.new
      @variables.each_key do |key|
        @var[key.to_sym] = @variables[key]
      end
      @variables = @var
    end
  end
end
