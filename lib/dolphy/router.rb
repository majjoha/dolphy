module Dolphy
  class Router
    attr_accessor :routes

    def initialize
      @routes = { get: {}, post: {}, put: {}, delete: {} }
    end

    %i(get post put delete head options patch trace).each do |verb|
      define_method(verb) do |path, &block|
        routes[verb][path] = block
      end
    end
  end
end
