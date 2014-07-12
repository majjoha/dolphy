$LOAD_PATH.unshift(File.dirname(__FILE__))
require './lib/dolphy'

Dolphy.app do
  Dolphy.router do
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
end.serve!
