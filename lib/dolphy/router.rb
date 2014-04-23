# This module handles all the methods that adds routes to our route array.
# It has an array containing all the routes ordered by HTTP method.
module Dolphy
  module Router
    attr_accessor :routes

    def initialize_router
      @routes = { :get => {}, :post => {}, :put => {}, :delete => {} }
    end

    def not_found
      erb :not_found
    end

    %w(get post put delete).each do |verb|
      define_method(verb) do |path, &block|
        add_route(verb.to_sym, path, block)
      end
    end

    private

    def add_route(http_method, path, block)
      routes[http_method][path] = block
    end
  end
end
