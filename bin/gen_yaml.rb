#!/usr/bin/env ruby

require 'yaml'

hash = {}

hash[:variables] = {:package_name => "apache",
                    :service_name => "apache",
}

f = File.open("apache.yaml",'w')
f.write(hash.to_yaml)
f.close
