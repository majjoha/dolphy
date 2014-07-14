module Dolphy
  class Configurations
    attr_accessor :configurations

    def initialize
      @configurations = { template_engine: :erb }
    end

    def [](element)
      configurations[element]
    end
  end
end
