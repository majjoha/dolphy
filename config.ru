$:.unshift('lib')
require 'dolphy'

DolphyApp.app do
  DolphyApp.router do
    get '/hello' do
      haml :index, body: "hello"
    end

    get '/wat' do
      erb :what, body: "wat"
    end

    get '/greeting' do
      erb :what, body: "Hello #{params["name"]}"
    end

    get '/' do
      haml :index, body: "index"
    end

    post '/post' do
      haml :post, body: "hello #{params["message"]["name"]}"
    end
  end
end.serve!
