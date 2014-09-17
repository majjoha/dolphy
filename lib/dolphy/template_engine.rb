require 'tilt'
require_relative 'template_engines/erb_engine'
require_relative 'template_engines/haml_engine'

module Dolphy
  class TemplateEngine
    include Dolphy::TemplateEngines

    def initialize(template_engine, view_path)
      @template_engine = template_engine
      @view_path       = view_path
    end

    def render(template_name, locals)
      template_engine.render(template_name, locals, view_path)
    end

    private

    attr_accessor :template_engine, :view_path
  end
end
