# Dolphy
Dolphy is an incredibly small web framework written in Ruby. It mimics the
behavior of Sinatra, and it is solely written for the purpose of learning how
Rack works.

There are a lot of things I want to do to improve the code and functionality of
this project. I list these things in the TODO file in the home directory.

## Usage
```ruby
DolphyApp.app do
  config do |c|
    # It is possible to specify the template engine in the config block. If no
    # template engine is specified, it will simply default to ERB.
    c.configurations[:template_engine] = :erb
  end

  DolphyApp.router do
    get '/hello' do
      render :index, body: "hello"
    end

    get '/wat' do
      render :what, body: "wat"
    end

    post '/post' do
      render :post, body: "hello #{params["message"]["name"]}"
    end
  end
end.serve!
```
