module Puppi
  class GenerateSampleData
    def initialize
    end
    
    def helpers
      File.open(Puppi::puppidir+'/helpers/standard.yml', 'w') {|f| f.write(
'--- 
:info: 
  -
    :command: echo "+ %{name} +"
    :description: "info module name for tests"
:check:
  -
    :command: echo "| %{name} |"
    :description: "check module name for tests"
  -
    :command: echo "| %{version} |"
    :description: "check module version"'
) }
    end
    
    def datafiles
      File.open(Puppi::puppidir+'/data/standard_openssh.yml', 'w') {|f| f.write(
'--- 
name: openssh
version: 1.0'
) }
      File.open(Puppi::puppidir+'/data/standard_hostname.yml', 'w') {|f| f.write(
'--- 
name: hostname'
) }
    end
  end
end