require 'haml'
require 'erb'

# This module provides a selection of template rendering methods.
#
# They are used like in Sinatra in the following way:
#
# get '/hello' do
#   haml :index, body: "Hello"
# end
# 
module Dolphy
  module TemplateEngines
    def haml(template_name, locals)
      template = File.open("views/#{template_name.to_s}.haml").read
      engine = Haml::Engine.new(template)
      engine.render(Object.new, locals)
    end

    def erb(template_name, locals=nil)
      template = File.open("views/#{template_name.to_s}.erb").read
      engine = ERB.new(template)
      engine.result(OpenStruct.new(locals).instance_eval { binding })
    end
  end
end
