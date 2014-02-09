# This module handles all the methods that adds routes to our route array.
# It has an array containing all the routes ordered by HTTP method.
module Dolphy
  module Router
    attr_accessor :routes

    def initialize_router
      @routes = { :get => {}, :post => {}, :put => {}, :delete => {} }
    end

    def get(path, &block)
      add_route(:get, path, block)
    end

    def post(path, &block)
      add_route(:post, path, block)
    end

    def put(path, &block)
      add_route(:put, path, block)
    end

    def delete(path, &block)
      add_route(:delete, path, block)
    end

    def not_found
      erb :not_found
    end

    private

    def add_route(http_method, path, block)
      routes[http_method][path] = block
    end
  end
end
