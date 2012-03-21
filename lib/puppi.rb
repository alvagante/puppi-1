module Puppi
  require 'fileutils'
  require 'puppi/action'
  require 'puppi/datafile'
  require 'puppi/generate_sample_data'
  require 'puppi/helper'
  require 'puppi/loader'
  require 'puppi/notification'
  require 'puppi/version'
  require 'yaml'
  
  @@puppidir = "/var/tmp/puppi/etc"

  def self.puppidir
    @@puppidir
  end
  
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