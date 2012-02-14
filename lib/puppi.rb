module Puppi
  require 'puppi/datafile'
  require 'puppi/helper'
  require 'yaml'

  attr_reader :data

  class << self

    def load_data_files
      Dir[puppi_conf_dir+"/data/*"].each do |file|
        load_data_file(file)
      end
    end

    def load_data_file file
      @data ||= []
      @data << Puppi::Datafile.new(YAML.load(File.read(puppidir+"/data/"+file))[:variables])
    end

    private
    def puppidir
      "/var/tmp/puppi/etc/"
    end
  end
end
