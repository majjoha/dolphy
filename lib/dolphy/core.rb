require 'dolphy/router'
require 'dolphy/request'
require 'dolphy/template_engine'
require 'dolphy/settings'
require 'dolphy/response'
require 'forwardable'
require 'rack'

module Dolphy
  class Core
    extend Forwardable
    include Dolphy::TemplateEngines

    delegate Dolphy::Router::HTTP_METHODS => :router

    attr_accessor :settings

    def initialize(&block)
      @router   = Dolphy::Router.new
      @settings = Dolphy::Settings.new
      instance_eval(&block)
    end

    def serve!
      Rack::Server.start(app: self)
    end

    def setup(&block)
      instance_eval(&block)
    end

    def render(template_name, locals = {})
      Dolphy::TemplateEngine.new(settings[:template_engine],
                                 settings[:view_path]).
        render(template_name, locals)
    end

    def redirect_to(path, status = 302)
      response.headers["Location"] = path
      response.status = status
    end

    def params
      request.params
    end

    # The main logic of Dolphy nests inside the call(env) method. It looks up
    # the route for the current request method in the routes hash, and if it
    # finds a route that matches the current path, it evaluates the block and
    # sets the response accordingly.
    def call(env)
      @request  = Dolphy::Request.new(env)
      @response = Dolphy::Response.new

      if content = router.find_route_for(request)
        response.body << instance_eval(&content)
      else
        response.status = 404
        response.body << "Page not found."
      end
      response.finish
    end

    private

    attr_accessor :response, :router, :request
  end
end
