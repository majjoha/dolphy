require_relative '../spec_helper'

describe Dolphy::Router do
  let(:router) { Dolphy::Router.new }

  it "is an instance of Dolphy::Router" do
    expect(router).to be_a(Dolphy::Router)
  end
  
  describe "#initialize" do
    it "initializes an empty router" do
      expect(router.routes).to eq({
        get: {},
        post: {},
        put: {},
        delete: {},
        head: {},
        options: {},
        patch: {},
        trace: {}
      })
    end
  end

  describe "#get" do
    it "adds a route to the router" do
      router.get '/' do
        'test'
      end

      expect(router.routes[:get]).to have_key '/'
    end
  end

  describe "#post" do
    it "adds a route to the router" do
      router.post '/' do
        'test'
      end

      expect(router.routes[:post]).to have_key '/'
    end
  end

  describe "#put" do
    it "adds a route to the router" do
      router.put '/' do
        'test'
      end

      expect(router.routes[:put]).to have_key '/'
    end
  end

  describe "#delete" do
    it "adds a route to the router" do
      router.delete '/' do
        'test'
      end

      expect(router.routes[:delete]).to have_key '/'
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

      expect(router.find_route_for(request).call).to eq "test"
    end
  end
end
