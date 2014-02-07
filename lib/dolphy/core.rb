require 'dolphy/router'
require 'dolphy/template_engines'
require 'rack'

module Dolphy
  class Core
    include Dolphy::TemplateEngines
    include Dolphy::Router

    attr_accessor :status, :headers, :response, :routes, :request

    def initialize(status = 200,
                   headers = {"Content-type" => "text/html"},
                   &block)
      @status = status
      @headers = headers
      @response = []
      @routes = initialize_router
      instance_eval(&block)
    end

    # Returns the parameters sent in the request, e.g. parameters in POST
    # requests.
    def params
      request.params 
    end

    # The main logic of the application nests inside the call(env) method.
    # It looks through all of the routes for the current request method, and
    # if it finds a route that matches the current path, it evalutes the block
    # and sets the response to the result of this evaluation.
    def call(env)
      http_method = env['REQUEST_METHOD'].downcase.to_sym
      path = env['PATH_INFO']
      self.request = Rack::Request.new(env)

      unless routes[http_method].nil?
        if block = routes[http_method][path]
          body = instance_eval(&block)
          self.response = [body]
        else
          self.status = 404
          self.response = ["Route not found!"]
        end
        [status, headers, response]
      end
    end
  end
end
