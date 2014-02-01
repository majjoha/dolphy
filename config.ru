require "#{File.dirname(__FILE__)}/lib/dolphy"

app = DolphyApplication.app do
  puts "Inside run DolphyApplication whatever"
  get '/hello' do
    haml :index, :body => "hello"
  end

  get '/wat' do
    haml :index, :body => "WAT"
  end
end

run app
