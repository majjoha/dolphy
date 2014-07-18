require_relative '../spec_helper'
require_relative '../../lib/dolphy/response'

describe Dolphy::Response do
  let(:response) { Dolphy::Response.new }

  describe "#initialize" do
    it "initializes a response with a status, headers and an empty body" do
      expect(response.status).to eq 200
      expect(response.headers).to eq({"Content-type" => "text/html"})
      expect(response.body).to eq []
    end
  end

  describe "#finish" do
    it "returns an array consisting of the status, headers and body" do
      expect(response.finish).to eq [200, {"Content-type" => "text/html"}, []]
    end
  end
end
