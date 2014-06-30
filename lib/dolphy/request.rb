module Dolphy
  # This acts as a simple wrapper class for a request. Its main purpose is to
  # simplify how the framework receives information about the path and HTTP
  # method of a request.
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
