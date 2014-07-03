require_relative '../spec_helper'

describe Dolphy::Core do
  let(:core) do
    Dolphy::Core.new do
      get '/' do
        'test'
      end
    end
  end

  it "is an instance of Dolphy::Core" do
    expect(core).to be_a(Dolphy::Core)
  end

  describe "#call" do
    context "when the page exists" do
      let(:env) do
        {
          "REQUEST_METHOD" => "GET",
          "PATH_INFO" => "/" 
        }
      end

      it "returns an array with a status, headers and the response" do
        expect(core.call(env)).to eq(
          [200, {"Content-type" => "text/html"}, ['test']] 
        )
      end
    end

    context "when the page doesn't exist" do
      let(:env) do
        {
          "REQUEST_METHOD" => "GET",
          "PATH_INFO" => "/404" 
        }
      end

      it "returns an array with a status set to 404, headers and the response
        set to 'Page not found'" do
        expect(core.call(env)).to(
          eq [404, {"Content-type" => "text/html"}, ['Page not found.']]
        )
      end
    end
  end
end
