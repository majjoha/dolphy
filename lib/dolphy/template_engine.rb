require 'tilt'

module Dolphy
  module TemplateEngines
    def erb(template_name, locals = {}, view_path = "../views/")
      template = Tilt::ERBTemplate.new("#{view_path}#{template_name.to_s}.erb")
      template.render(Object.new, locals)
    end

    def haml(template_name, locals = {}, view_path = "../views/")
      template = Tilt::HamlTemplate.new("#{view_path}/#{template_name.to_s}.haml")
      template.render(Object.new, locals)
    end
  end

  class TemplateEngine
    include Dolphy::TemplateEngines

    def initialize(template_engine, view_path)
      @template_engine = template_engine
      @view_path = view_path
    end

    def render(template_name, locals)
      case template_engine
      when :erb
        erb(template_name, locals, view_path)
      when :haml
        haml(template_name, locals, view_path)
      end
    end

    private

    attr_accessor :template_engine, :view_path
  end
end
