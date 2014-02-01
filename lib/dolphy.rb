require "#{File.dirname(__FILE__)}/dolphy/templates"
require 'haml'
require 'rack'

module Dolphy
  class Core
    include Dolphy::Templates

    def initialize(status = 200,
                   headers = {"Content-type" => "text/html"})
      @status = status
      @headers = headers
      @response = []
    end

    def get(path, options = {}, &block)
      @response = [yield]
    end

    def call(env)
      get '/hello' do
        haml :index, :body => "Hello"
      end
      [@status, @headers, @response]
    end
  end
end
