$:.unshift(File.expand_path('../lib/', __FILE__))

require 'dolphy/version'

Gem::Specification.new do |s|
  s.name        = "dolphy"
  s.version     = Dolphy::VERSION
  s.date        = "2014-08-14"
  s.summary     = "A small and simple web framework."
  s.description = "Dolphy is an incredibly small (~200 LOC) web framework."
  s.author      = ["Mathias Jean Johansen"]
  s.email       = "mathias@mjj.io"
  s.files       = Dir['TODO', 'README.md', 'LICENSE', 'lib/**/*']
  s.test_files  = Dir['spec/**/*.rb']
  s.homepage    = "https://github.com/majjoha/dolphy"
  s.license     = "MIT"

  s.add_runtime_dependency 'tilt', '~> 2.0'
  s.add_runtime_dependency 'rack', '~> 1.2'
  s.add_runtime_dependency 'haml', '~> 4.0'
  s.add_runtime_dependency 'erubis', '~> 2.7'
  s.add_development_dependency 'rake', '~> 10.3.1'
  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'capybara', '~> 2.2'
  s.add_development_dependency 'capybara-webkit', '~> 1.2'
end
