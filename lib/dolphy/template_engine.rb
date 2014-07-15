require 'tilt'

module Dolphy
  module TemplateEngines
    def erb(template_name, locals = {})
      template = Tilt::ERBTemplate.new("views/#{template_name.to_s}.erb")
      template.render(Object.new, locals)
    end

    def haml(template_name, locals = {})
      template = Tilt::HamlTemplate.new("views/#{template_name.to_s}.haml")
      template.render(Object.new, locals)
    end
  end

  class TemplateEngine
    include Dolphy::TemplateEngines

    def initialize(template_engine)
      @template_engine = template_engine
    end

    def render(template_name, locals)
      case template_engine
      when :erb
        erb(template_name, locals)
      when :haml
        haml(template_name, locals)
      end
    end

    private

    attr_accessor :template_engine
  end
end
