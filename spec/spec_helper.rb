require 'fakefs/spec_helpers'

require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
     # Ativa output colorido
     config.color_enabled = true
     # Define qual o framework de mocks.
     # Pode ser :rspec, :mocha, :rr, :flexmock, :none
     config.mock_framework = :rspec
     # Ativa o modo de debug.
     # É necessário ter o ruby-debug instalado.
     #config.debug = true
     # Exibe backtrace completo caso algum exemplo falhe.
     config.full_backtrace = true
     # Define uma expressão regular que irá evitar que uma
     # linha do backtrace apareça quando um exemplo falha.
     config.backtrace_clean_patterns << /vendor\//
     # Inclui um módulo. Os métodos desse módulo estarão disponíveis no
     # contexto dos métodos `it`, `specify`, `before`, `after` e `around`.
     config.include Module.new
     # Inclui um módulo somente nos grupos que casarem o padrão
     # especificado pela opção `:file_path`. Esses arquivos irão
     # ser definidos como sendo do tipo `:foo`, e irão carregar
     # somente módulos deste tipo.
     config.include Module.new, :type => :foo, :example_group => {:file_path => /spec\/robots/}
     config.include FakeFS::SpecHelpers
     # Estende o grupo de exemplos com o módulo especificado.
     # Os métodos deste módulo estão disponíveis no contexto
     # dos métodos `describe` e `context`.
     config.extend Module.new
     # Executa o bloco antes de cada exemplo de um grupo.
     config.before {}
     # Executa o bloco antes de todos os exemplos de um grupo.
     config.before(:all) {}
     # Executa o bloco depois de cada exemplo de um grupo.
     #config.after {}
     # Executa o bloco depois de todos os exemplos de um grupo.
     config.after(:all) {}
     # Executa o bloco antes e depois de cada exemplo de um grupo.
     #config.around {}
     # Para a execução da suíte no primeiro exemplo que falhar.
     config.fail_fast = true
     # Executa somente os exemplos que possuirem o filtro `:slow`.
     # config.filter_run :slow => true
     # Não executa os exemplos caso o bloco retorne um valor que seja
     # avaliado como `true`.
     #config.exclusion_filter = {:ruby => lambda {|version| RUBY_VERSION.to_s !~ /^#{version.to_s}/ }}
end