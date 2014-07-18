$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'rack/test'
require 'capybara'
require './lib/dolphy'

ENV['RACK_ENV'] = 'test'

app = DolphyApp.app do
  config do |c|
    c.configurations[:template_engine] = :haml
    c.configurations[:view_path] = "./spec/views/"
  end

  DolphyApp.router do
    get '/' do
      render :index, { title: "booyah!", body: "Hello" }
    end

    post '/post' do
      render :post, { body: "Hello #{params["message"]["name"]}" }
    end

    get '/hello' do
      "hello world!"
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
