module Dolphy
  module Router
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
