module Dolphy
  class Response
    attr_accessor :status, :headers, :body

    def initialize(status = 200,
                   headers = {"Content-type" => "text/html"})
      @status = status
      @headers = headers
      @body = []
    end

    def finish
      [status, headers, body]
    end
  end
end
