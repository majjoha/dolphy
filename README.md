# Dolphy
Dolphy is an incredibly small web framework written in Ruby and based on Rack.
It was originally mimicking the behavior of Sinatra, but as time has passed, it
has slightly changed direction and is now more of a mix between different web
frameworks.

It has solely been written for the purpose of learning and is not meant to be
used in production.

There are a lot of things I want to do to improve the code and functionality of
this project. I try to list these things in the
[TODO](https://github.com/majjoha/dolphy/blob/master/TODO) file in the home
directory of the project. Feel free to fork this repository and contribute if
you want to help me implement some of the listed features.

## Inspiration
I've been looking in my directions for inspiration. I probably owe some credit
to [Camping](http://camping.io), [Cuba](http://cuba.is),
[NYNY](http://alisnic.github.io/nyny/), and obviously
[Sinatra](http://sinatrarb.com) and [Rails](http://rubyonrails.org).

## Usage
```ruby
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
```
