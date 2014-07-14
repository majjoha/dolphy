require 'dolphy/router'
require 'dolphy/request'
require 'dolphy/template_engine'
require 'dolphy/configurations'
require 'forwardable'
require 'rack'

module Dolphy
  class Core
    extend Forwardable
    include Dolphy::TemplateEngines

    Dolphy::Router::HTTP_METHODS.each do |verb|
      def_delegator :router, verb
    end

    attr_accessor :configurations

    def initialize(status = 200,
                   headers = {"Content-type" => "text/html"},
                   &block)
      @status = status
      @headers = headers
      @response = []
      @router = Dolphy::Router.new
      @configurations = Dolphy::Configurations.new
      instance_eval(&block)
    end

    def serve!
      Rack::Server.start(app: self)
    end

    def config(&block)
      instance_eval(&block)
    end

    def render(template_name, locals = {})
      Dolphy::TemplateEngine.new(configurations[:template_engine]).
        render(template_name, locals)
    end

    def params
      request.params 
    end

    # The main logic of Dolphy nests inside the call(env) method. It looks up
    # the route for the current request method in the routes hash, and if it
    # finds a route that matches the current path, it evaluates the block and
    # sets the response accordingly.
    def call(env)
      @request = Dolphy::Request.new(env)
      http_method, path = @request.http_method, @request.path

      if block = router.routes[http_method][path]
        @status = 200
        @response = instance_eval(&block)
      else
        @status = 404
        @response = "Page not found."
      end
      [status, headers, [response]]
    end

    private

    attr_accessor :status, :headers, :response, :router, :request
  end
end
