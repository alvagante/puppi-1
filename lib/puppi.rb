module Puppi
  require 'fileutils'
  require 'puppi/files/datafile'
  require 'puppi/files/helper'
  require 'puppi/files/notification'
  require 'puppi/action'
  require 'puppi/generate_sample_data'
  require 'puppi/loader'
  require 'puppi/notification'
  require 'puppi/notifications/mail'
  require 'puppi/notifications/stdout'
  require 'puppi/version'
  require 'yaml'
  
  @@puppidir = "/etc/puppi"
  
  class << self
    def puppidir
      @@puppidir
    end
    
    def initial_checks
      directories = %w[ data helpers notifications ]
      directories.each do |directory|
        FileUtils.mkdir_p @@puppidir+'/'+directory
        raise "Puppi::NoPuppiDir" unless File.directory?(puppidir+'/'+directory)
      end
    end
  end
end