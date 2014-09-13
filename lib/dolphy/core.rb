require 'dolphy/router'
require 'dolphy/request'
require 'dolphy/template_engine'
require 'dolphy/settings'
require 'dolphy/response'
require 'forwardable'
require 'socket'
require 'net/http'
require 'cgi'
require 'logger'

module Dolphy
  class Core
    extend Forwardable
    include Dolphy::TemplateEngines

    delegate Dolphy::Router::HTTP_METHODS => :router

    attr_accessor :settings

    def initialize(&block)
      @router   = Dolphy::Router.new
      @settings = Dolphy::Settings.new
      @response = Dolphy::Response.new
      @request  = nil
      @port     = 2345
      @server   = TCPServer.new('localhost', port)
      @logger   = Logger.new(STDOUT)
      instance_eval(&block)
    end

    def serve!
      logger.info("Application was started on port #{port}")
      run
    end

    def setup(&block)
      instance_eval(&block)
    end

    def render(template_name, locals = {})
      Dolphy::TemplateEngine.new(settings[:template_engine],
                                 settings[:view_path]).
        render(template_name, locals)
    end

    def redirect_to(path, status = 302)
      response.headers["Location"] = path
      response.status = status
    end

    def params
      # Take a look at http://www.ruby-doc.org/stdlib-2.1.2/libdoc/uri/rdoc/URI.html#method-c-encode_www_for
      # for how to handle parameters.
      h = Hash.new
      h.default = "hello"
      h
    end

    def run
      loop do
        Thread.start(server.accept) do |socket|
          request = socket.gets

          logger.info("#{Time.now}: #{request}")

          # Find block matching the received request and call it with the
          # match captures.
          router.find_route_for(request).each do |matcher, block|
            if match = router.find_match_data_for(request, with: matcher)
              response.body << block.call(*match.captures)
            end
          end

          # Return the headers and response body.
          socket.print(response)

          # Reset the response.
          response.finish

          # Close the socket, terminating the connection.
          socket.close
        end
      end
    end

    attr_accessor :response, :request, :router, :request, :server, :logger, :port
  end
end
