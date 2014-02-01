require "#{File.dirname(__FILE__)}/dolphy/router"
require "#{File.dirname(__FILE__)}/dolphy/templates"
require 'haml'
require 'rack'

class DolphyApplication
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
      instance_eval &block #yield
    end

    def add_route(http_method, path, block)
      routes[http_method][path] = block
    end

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
