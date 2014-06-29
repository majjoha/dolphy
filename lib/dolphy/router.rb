module Dolphy
  class Router
    attr_accessor :routes

    def initialize
      @routes = { :get => {}, :post => {}, :put => {}, :delete => {} }
    end

    %w(get post put delete).each do |verb|
      define_method(verb) do |path, &block|
        routes[verb.to_sym][path] = block
      end
    end
  end
end
