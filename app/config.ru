$LOAD_PATH.unshift(File.dirname(__FILE__))
require './lib/dolphy'

app = DolphyApplication.app do
  get '/hello' do
    haml :index, body: "hello"
  end

  get '/wat' do
    erb :what, body: "wat"
  end

  get '/' do
    haml :index, body: "index"
  end

  post '/post' do
    haml :post, body: "hello #{params["message"]["name"]}"
  end
end

run app
