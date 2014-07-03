require_relative '../spec_helper'

describe Dolphy::Request do
  let(:env) do
    Dolphy::Request.new({
      "REQUEST_METHOD" => "GET",
      "PATH_INFO" => "/"
    })
  end

  describe "#http_method" do
    it "returns the HTTP method as a lowercase symbol" do
      expect(env.http_method).to eq :get
    end
  end

  describe "#path" do
    it "returns the path information" do
      expect(env.path).to eq "/"
    end
  end
end
