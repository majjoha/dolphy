require "#{File.dirname(__FILE__)}/dolphy/router"
require "#{File.dirname(__FILE__)}/dolphy/templates"
require 'rack'

class DolphyApplication
# This returns a DolphyApplication defined by what is passed in the block.
#
# An application could for instance be defined in this way
#
# app = DolphyApplication.app do
#   get '/hello' do
#     haml :index, :body => "Hello"
#   end
# end
#
# run app
  class << self
    def app(&block)
      Dolphy::Core.new(&block)
    end
  end
end

module Dolphy
  class Core
    include Dolphy::Templates
    include Dolphy::Router

    attr_reader :status, :headers, :response, :routes

    def initialize(status = 200,
                   headers = {"Content-type" => "text/html"},
                   &block)
      @status = status
      @headers = headers
      @response = []
      @routes = { :get => {}, :post => {}, :put => {}, :delete => {} }
      instance_eval &block
    end

    def add_route(http_method, path, block)
      routes[http_method][path] = block
    end

    # The main logic of the application nests inside the call(env) method.
    # It looks through all of the routes for the current request method, and
    # if it finds a route that matches the current path, it evalutes the block
    # and sets the response to the result of this evaluation.
    def call(env)
      http_method = env['REQUEST_METHOD'].downcase.to_sym
      path = env['PATH_INFO']

      routes[http_method].each do |url, block|
        if url == path
          body = instance_eval &block
          @response = [body]
        else
          [404, {}, "Route not found!"]
        end
      end
      [status, headers, response]
    end
  end
end
