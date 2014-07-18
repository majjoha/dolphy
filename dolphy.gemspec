$:.unshift(File.expand_path('../lib/', __FILE__))

require 'dolphy/version'

Gem::Specification.new do |s|
  s.name        = "Dolphy"
  s.version     = Dolphy::VERSION
  s.date        = "2014-08-14"
  s.summary     = "A small and simple web framework."
  s.description = "A small and simple web framework."
  s.author      = ["Mathias Jean Johansen"]
  s.email       = "mathias@mjj.io"
  s.files       = Dir['TODO', 'README.md', 'LICENSE', 'lib/**/*']
  s.test_files  = Dir['spec/**/*.rb']
  s.homepage    = "https://github.com/majjoha/dolphy"
  s.license     = "MIT"
end
