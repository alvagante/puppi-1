# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "puppi/version"

Gem::Specification.new do |s|
  s.name        = "puppi"
  s.version     = Puppi::VERSION
  s.authors     = ["Celso Fernandes"]
  s.email       = ["fernandes@zertico.com"]
  s.homepage    = "http://fernandes.github.com/puppi"
  s.summary     = %q{Puppet module to manage applications deployments and servers local management}
  s.description = <<-EOF
Puppi is a Puppet module that lets sysadmins standardize, manage and automate the deployment of web applications 
and provides quick and standard commands to obtain informations about the system and what’s is going on it.

Its structure provides FULL flexibility on the actions required for virtually any kind of application deployment 
and information gathering.
EOF

  s.rubyforge_project = "puppi"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
