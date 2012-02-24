module Puppi
  require 'puppi/datafile'
  require 'puppi/helper'
  require 'puppi/generate_sample_data'
  require 'fileutils'
  require 'puppi/action'
  require 'yaml'

  attr_reader :data, :datafiles, :helpers

  class << self
    def puppidir
      "/var/tmp/puppi/etc"
    end
    
    def initial_checks
      FileUtils.mkdir_p puppidir+'/data'
      FileUtils.mkdir_p puppidir+'/helpers'
      raise "Puppi::NoPuppiDir" unless File.directory?(puppidir+'/data')
      raise "Puppi::NoPuppiDir" unless File.directory?(puppidir+'/helpers')
    end

    def all_helpers
      @helpers = Array.new
      Dir.glob(puppidir+'/helpers/*.yml').each do |file|
        @helpers << File.basename(file, '.yml')
      end
      @helpers
    end

    def load_helperfile helper, action
      all_helpers unless not @helpers.nil?
      raise 'Invalid Helper' unless @helpers.include? helper
      @helper_content = YAML.load(File.read(puppidir+"/helpers/"+helper+".yml"))
      @helper_commands = Array.new
      return nil unless not @helper_content[action.to_sym].nil?
      @helper_content[action.to_sym].each do |command|
        @helper_commands << Puppi::Helper.new(command)
      end
      @helper_commands
    end
    
    def all_datafiles (puppi_module = nil)
      @datafiles = Array.new
      if puppi_module.nil?
        Dir.glob(puppidir+'/data/*.yml').each do |file|
          @datafiles << File.basename(file, '.yml')
        end
      else
        Dir.glob(puppidir+'/data/*_'+puppi_module+'.yml').each do |file|
          @datafiles << File.basename(file, '.yml')
        end
      end
      @datafiles
    end

    def load_datafile file
      all_datafiles unless not @datafiles.nil?
      raise 'Invalid Datafile' unless @datafiles.include? file
      Puppi::Datafile.new(YAML.load(File.read(puppidir+"/data/"+file+".yml")))
    end
  end
end