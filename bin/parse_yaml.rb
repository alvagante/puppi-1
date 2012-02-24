#!/usr/bin/env ruby

require 'yaml'

yamlfile = ARGV[0]

attributes = YAML.load(File.read(yamlfile)).to_hash

attributes.each do |k,v|
  puts "#{k}: #{v}"
end
