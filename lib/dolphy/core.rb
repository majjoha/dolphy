require 'dolphy/router'
require 'dolphy/template_engines'
require 'rack'

module Dolphy
  class Core
    include Dolphy::TemplateEngines
    include Dolphy::Router

    attr_reader :status, :headers, :response, :routes

    def initialize(status = 200,
                   headers = {"Content-type" => "text/html"},
                   &block)
      @status = status
      @headers = headers
      @response = []
      @routes = initialize_router
      instance_eval(&block)
    end

    # The main logic of the application nests inside the call(env) method.
    # It looks through all of the routes for the current request method, and
    # if it finds a route that matches the current path, it evalutes the block
    # and sets the response to the result of this evaluation.
    def call(env)
      http_method = env['REQUEST_METHOD'].downcase.to_sym
      path = env['PATH_INFO']

      unless routes[http_method].nil?
        routes[http_method].each do |url, block|
          if url == path
            body = instance_eval(&block)
            @response = [body]
          else
            [404, {}, "Route not found!"]
          end
        end
        [status, headers, response]
      end
    end
  end
end
