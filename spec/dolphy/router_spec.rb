require_relative '../spec_helper'

describe Dolphy::Router do
  let(:router) { Dolphy::Router.new }

  it "is an instance of Dolphy::Router" do
    expect(router).to be_a(Dolphy::Router)
  end

  describe "#initialize" do
    it "initializes an empty router" do
      expect(router.routes).to eq({})
    end
  end

  describe "#get" do
    it "adds a route to the router" do
      router.get '/' do
        'test'
      end

      expect(router.routes[:get].flatten.first).to eq /\A\z/
      expect(router.routes[:get].flatten.last.call).to eq "test"
    end
  end

  describe "#post" do
    it "adds a route to the router" do
      router.post '/' do
        'test'
      end

      expect(router.routes[:post].flatten.first).to eq /\A\z/
      expect(router.routes[:post].flatten.last.call).to eq "test"
    end
  end

  describe "#put" do
    it "adds a route to the router" do
      router.put '/' do
        'test'
      end

      expect(router.routes[:put].flatten.first).to eq /\A\z/
      expect(router.routes[:put].flatten.last.call).to eq "test"
    end
  end

  describe "#delete" do
    it "adds a route to the router" do
      router.delete '/' do
        'test'
      end

      expect(router.routes[:delete].flatten.first).to eq /\A\z/
      expect(router.routes[:delete].flatten.last.call).to eq "test"
    end
  end

  describe "#find_route_for" do
    let(:request) do
      Dolphy::Request.new({
        "REQUEST_METHOD" => "GET",
        "PATH_INFO" => "/"
      })
    end

    it "returns the block associated with the route" do
      router.get '/' do
        'test'
      end

      expect(router.find_route_for(request).flatten.last.call).to eq "test"
    end
  end
end
