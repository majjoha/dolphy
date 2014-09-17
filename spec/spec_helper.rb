$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'rack/test'
require 'capybara'
require './lib/dolphy'

ENV['RACK_ENV'] = 'test'

app = Dolphy.app do
  setup do |app|
    app.settings[:template_engine] = Dolphy::TemplateEngines::HamlEngine
    app.settings[:view_path] = "./spec/views/"
  end

  Dolphy.router do
    get '/' do
      render :index, { title: "booyah!", body: "Hello" }
    end

    post '/post' do
      render :post, { body: "Hello #{params["message"]["name"]}" }
    end

    get '/hello' do
      "hello world!"
    end

    get '/wat' do
      redirect_to '/hello'
    end

    get '/hello/:name' do |name|
      "hello #{name}"
    end
  end
end

Capybara.javascript_driver = :webkit
Capybara.app = app

module SpecHelper
  include Rack::Test::Methods

  def app
    Capybara.app
  end
end

RSpec.configure do |config|
  config.include SpecHelper
  config.include Capybara::DSL
end
