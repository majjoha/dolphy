# Dolphy
Dolphy is an incredibly small web framework written in Ruby. It mimics the
behavior of Sinatra, and it is solely written for the purpose of learning how
Rack works.

There are a lot of things I want to do to improve the code and functionality of
this project. I list these things in the TODO file in the home directory.

## Example
```ruby
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
```
