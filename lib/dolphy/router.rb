module Dolphy
  class Router
    attr_accessor :routes

    HTTP_METHODS = %i(get post put delete head options patch trace)

    def initialize
      @routes = default_http_verbs
    end

    HTTP_METHODS.each do |verb|
      define_method(verb) do |path, &block|
        routes[verb][path] = block
      end
    end

    private
    
    def default_http_verbs
      {
        get: {},
        post: {},
        put: {},
        delete: {},
        head: {},
        options: {},
        patch: {},
        trace: {}
      }
    end
  end
end
