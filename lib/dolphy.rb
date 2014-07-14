$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'dolphy/core'
require 'dolphy/version'

class DolphyApp
  class << self
    def app(&block)
      Dolphy::Core.new(&block)
    end

    def router(&block)
      yield
    end
  end
end
