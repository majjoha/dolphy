require "#{File.dirname(__FILE__)}/lib/dolphy"

app = DolphyApplication.app do
  get '/hello' do
    haml :index, :body => "hello"
  end

  get '/wat' do
    erb :what, :body => "WAT"
  end
end

run app
