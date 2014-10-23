module Dolphy
  class Settings
    attr_accessor :settings

    def initialize
      @settings = default_settings
    end

    def [](element)
      settings[element]
    end

    def []=(key, value)
      settings[key] = value
    end

    private

    def default_settings
      {
        template_engine: Dolphy::TemplateEngines::ErbEngine,
        view_path: "./views/"
      }
    end
  end
end
