require 'rack'

module Dolphy
  class Request < Rack::Request
    attr_accessor :env

    def initialize(env)
      @env = env
    end

    def http_method
      @env['REQUEST_METHOD'].downcase.to_sym
    end

    def path
      @env['PATH_INFO']
    end
  end
end
