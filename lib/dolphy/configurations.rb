module Dolphy
  class Configurations
    attr_accessor :configurations

    def initialize
      @configurations = configuration_defaults
    end

    def [](element)
      configurations[element]
    end

    def []=(key, value)
      configurations[key] = value
    end

    private

    def configuration_defaults
      { template_engine: :erb }
    end
  end
end
