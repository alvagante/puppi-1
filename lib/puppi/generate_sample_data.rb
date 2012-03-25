module Puppi
  class GenerateSampleData
    def initialize
    end
    
    def helpers
      write_file '/helpers/standard.yml', '--- 
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
    end
    
    def datafiles
      write_file '/data/standard_openssh.yml', '--- 
name: openssh
version: 1.0'
      write_file '/data/standard_hostname.yml', '--- 
name: hostname'
    end
    
    def notifications
      write_file '/notifications/mail_user1.yml', '--- 
from: puppi@puppi.com
to: user1@mail.com
subject: \'[puppi] notification\''
      write_file '/notifications/mail_user2.yml', '--- 
from: puppi@puppi.com
to: user2@mail.com
subject: \'[puppi] notification\''
    end
    
    private
    def write_file file, string
      File.open(Puppi::puppidir+file, 'w') {|f| f.write(string) }
    end
  end
end