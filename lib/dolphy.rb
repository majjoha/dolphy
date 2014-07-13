$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'dolphy/core'

class DolphyApp
  def self.app(&block)
    Dolphy::Core.new(&block)
  end

  def self.router(&block)
    yield
  end
end
