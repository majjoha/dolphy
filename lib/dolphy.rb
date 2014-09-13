$:.unshift File.dirname(__FILE__)
require 'dolphy/core'
require 'dolphy/version'

module Dolphy
  class << self
    def app(&block)
      Dolphy::Core.new(&block)
    end

    def router(&block)
      yield
    end
  end
end
