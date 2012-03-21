module Puppi
  class Action
    attr_reader :puppi_module, :output
    
    def initialize (options)
      @loader = Puppi::Loader.new
      @actions = [ 'check', 'log', 'info' ]
      if options[:puppi_module].nil?
        @puppi_module = nil
      else
        @puppi_module = options[:puppi_module].to_s
      end
      if @actions.include? options[:action].to_s
        execute options[:action].to_s
      else
        raise "No Action Found"
      end
    end
    
    def execute action
      @datafiles = @loader.load_all('data', @puppi_module)
      @output = Array.new
      @datafiles.each do |datafile|
        @loaded_datafile = @loader.load_datafile(datafile)
        datafile_helper = datafile.split("_")[0]
        module_helper = datafile.split("_")[1]
        @helper_commands = @loader.load_helperfile datafile_helper, action
        return nil unless not @helper_commands.nil?
        @helper_commands.each do |command|
          @output << (run_command command, module_helper)
        end
      end
    end
    
    private
    def run_command command, module_helper
      @running_command = prepare_command command.command
      output = IO.popen(@running_command, :err => [:child, :out]) unless @running_command.nil?
      output.nil? ? nil : output.read
    end
    
    def prepare_command command
      begin
        command % @loaded_datafile.variables
      rescue KeyError
        nil
      end 
    end
  end
end