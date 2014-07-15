$:.unshift(File.expand_path('../lib/', __FILE__))

require 'dolphy/version'

Gem::Specification.new do |s|
  s.name        = "Dolphy"
  s.version     = Dolphy::VERSION
  s.date        = "2014-08-14"
  s.summary     = "A simple web framework"
  s.description = "It is actually pretty simple."
  s.author      = ["Mathias Jean Johansen"]
  s.email       = "mathias@mjj.io"
  s.files       = `git ls-files`.split("\n")
  s.homepage    = "https://github.com/majjoha/dolphy"
  s.license     = "MIT"
end
