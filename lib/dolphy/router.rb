module Dolphy
  class Router
    attr_accessor :routes

    HTTP_METHODS = %i(get post put delete head options patch trace)

    def initialize
      @routes = { get: {}, post: {}, put: {}, delete: {} }
    end

    HTTP_METHODS.each do |verb|
      define_method(verb) do |path, &block|
        routes[verb][path] = block
      end
    end
  end
end
