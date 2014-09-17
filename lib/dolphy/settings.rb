module Dolphy
  class Settings
    attr_accessor :settings

    def initialize
      @settings = settings_defaults
    end

    def [](element)
      settings[element]
    end

    def []=(key, value)
      settings[key] = value
    end

    private

    def settings_defaults
      {
        template_engine: Dolphy::TemplateEngines::ErbEngine,
        view_path: "./views/"
      }
    end
  end
end
