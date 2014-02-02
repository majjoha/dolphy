$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'rack/test'
require 'capybara'
require './lib/dolphy'

ENV['RACK_ENV'] = 'test'

Capybara.default_driver = :selenium

app = DolphyApplication.app do
  get '/hello' do
    haml :index, :body => "Hello"
  end
end

Capybara.app = app

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
end
