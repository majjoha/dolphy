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

  describe "#config" do
    let(:app) do
      Dolphy::Core.new do
        setup do |app|
          app.settings[:title] = "booyah!"
        end

        get '/' do
          'test'
        end
      end
    end

    it "configures the app" do
      expect(app.settings.settings).
        to eq(
          {
            template_engine: :erb,
            view_path: "./views/",
            title: "booyah!"
          }
        )
    end
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

  describe "#redirect_to" do
    let(:app) do
      Dolphy::Core.new do
        get '/' do
          'test'
        end

        get '/test' do
          redirect_to '/'
        end
      end
    end

    let(:env) do
      {
        "REQUEST_METHOD" => "GET",
        "PATH_INFO" => "/test"
      }
    end

    it "sets the HTTP status to 302" do
      expect(app.call(env)).to(
        eq [302, {"Content-type" => "text/html", "Location" => "/"}, [302]]
      )
    end
  end
end
