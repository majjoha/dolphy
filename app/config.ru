$LOAD_PATH.unshift(File.dirname(__FILE__))
require './lib/dolphy'

DolphyApp.app do
  config do |c|
    c.configurations[:template_engine] = :haml
    c.configurations[:title] = "booyah!"
  end

  DolphyApp.router do
    get '/hello' do
      render :index, body: "hello"
    end

    get '/wat' do
      erb :what, body: "wat"
    end

    get '/' do
      render :index, { title: configurations[:title], body: "index" }
    end

    post '/post' do
      render :post, body: "hello #{params["message"]["name"]}"
    end
  end
end.serve!
