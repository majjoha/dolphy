module Dolphy
  class Router
    attr_accessor :routes

    HTTP_METHODS = %i(get post put delete head options patch trace)

    def initialize
      @routes = Hash.new { |h, k| h[k] = [] }
    end

    def find_route_for(request)
      routes[http_method(request)]
    end

    def find_match_data_for(request, with:)
      trim_trailing_slash(path_info(request)).match(with)
    end

    HTTP_METHODS.each do |verb|
      define_method(verb) do |path, &block|
        routes[verb] << [matcher(path), block]
      end
    end

    private

    def path_info(request)
      request_uri  = request.split(" ")[1]
      path         = URI.unescape(URI(request_uri).path)

      path
    end

    def http_method(request)
      request.split(" ")[0].downcase.to_sym
    end

    def trim_trailing_slash(string)
      string.gsub(/\/$/, "")
    end

    def matcher(path)
      re = path.gsub(/\:[^\/]+/, "([^\/]+)")
      %r{\A#{trim_trailing_slash(re)}\z}
    end
  end
end
