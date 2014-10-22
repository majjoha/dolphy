require 'dolphy/core'
require 'dolphy/version'

module Dolphy
  class << self
    def app(&block)
      Dolphy::Core.new(&block)
    end

    def router
      yield
    end
  end
end
