require 'tilt'

module Dolphy
  module TemplateEngines
    class ErbEngine
      def self.render(template_name, locals = {}, view_path = "./views/")
        path = File.expand_path("#{view_path}#{template_name.to_s}.erb", Dir.pwd)
        template = Tilt::ERBTemplate.new(path)
        template.render(Object.new, locals)
      end
    end
  end
end
