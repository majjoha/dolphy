module Dolphy
  # This class provides a selection of template rendering methods.
  module Templates
    def haml(template_name, locals)
      template = File.open("views/#{template_name.to_s}.haml").read
      engine = Haml::Engine.new(template)
      engine.render(Object.new, locals)
    end
  end
end
