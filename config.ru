$:.unshift('lib')
require 'dolphy'

DolphyApp.app do
  DolphyApp.router do
    get '/' do
      haml :index, { title: "Hello!", body: "index" }
    end

    get '/wat' do
      erb :what, body: "wat"
    end

    get '/greeting' do
      erb :what, body: "Hello #{params["name"]}"
    end

    post '/post' do
      haml :post, body: "hello #{params["message"]["name"]}"
    end
  end
end.serve!
