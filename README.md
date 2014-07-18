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
```

## License
Copyright (c) 2014 Mathias Jean Johansen <mathias@mjj.io>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
