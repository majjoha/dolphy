module Dolphy
  module Router
    # This module handles all the methods that adds routes to our route array.
    # Ideally, it should also be able to return the routes and have the
    # add_route method in some way, but that is a thing to do later on.

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
  end
end
