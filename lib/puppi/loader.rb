module Puppi
  class Loader
    
    attr_reader :data, :datafiles, :helpers, :notifications
    
    def load_all (file_type, puppi_module = nil, notification_method = nil)  
      if file_type == 'data' and puppi_module != nil
        file_glob = '*_'+puppi_module
      elsif file_type == 'notifications' and notification_method != nil
        file_glob = notification_method + '_*'
      else
        file_glob = '*'
      end
      
      @all = Array.new
      Dir.glob(Puppi::puppidir+'/'+file_type+'/'+file_glob+'.yml').each do |file|
        @all << File.basename(file, '.yml')
      end
      @all
    end
    
    def load_helperfile helper, action
      @helpers = load_all('helpers') unless not @helpers.nil?
      raise 'Invalid Helper' unless @helpers.include? helper
      @helper_content = YAML.load(File.read(Puppi::puppidir+"/helpers/"+helper+".yml"))
      @helper_commands = Array.new
      return nil unless not @helper_content[action.to_sym].nil?
      @helper_content[action.to_sym].each do |command|
        @helper_commands << Puppi::Files::Helper.new(command)
      end
      @helper_commands
    end

    def load_datafile file
      @datafiles = load_all('data') unless not @datafiles.nil?
      raise 'Invalid Datafile' unless @datafiles.include? file
      Puppi::Files::Datafile.new(YAML.load(File.read(Puppi::puppidir+"/data/"+file+".yml")))
    end

    def load_notification file
      @notifications = load_all('notifications') unless not @notifications.nil?
      raise 'Invalid Notification' unless @notifications.include? file
      Puppi::Files::Notification.new(YAML.load(File.read(Puppi::puppidir+"/notifications/"+file+".yml")))
    end
  end
end