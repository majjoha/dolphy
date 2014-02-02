$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'rack/test'
require 'capybara'
require './lib/dolphy'

ENV['RACK_ENV'] = 'test'

# This is the app we are going to test.
app = DolphyApplication.app do
  get '/' do
    haml :index, :body => "Hello"
  end

  post '/post' do
    haml :post, :body => "Hello #{params["message"]["name"]}"
  end
end

Capybara.default_driver = :selenium
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
