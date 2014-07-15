require 'dolphy'

DolphyApp.app do
  config do |c|
    # It is possible to specify the template engine in the config block. If no
    # template engine is specified, it will simply default to ERB.
    c.configurations[:template_engine] = :haml

    # Configurations are available to the rest of the application defined in the
    # router block, so we could for instance define a title.
    c.configurations[:title] = "Building things with Dolphy"
  end

  DolphyApp.router do
    get '/' do
      erb :index, { title: configurations[:title], body: "Hello!" }
    end

    get '/login' do
      render :login
    end

    post '/post' do
      render :post, body: "hello #{params["message"]["name"]}"
    end
  end
end.serve!
