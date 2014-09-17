# Dolphy
[![Build Status](https://magnum.travis-ci.com/majjoha/dolphy.svg?token=G5jfvsY2S8tSb5P53rGq&branch=master)](https://magnum.travis-ci.com/majjoha/dolphy)
[![Code Climate](https://codeclimate.com/repos/53cb2ea469568031fe01ad3f/badges/a7a6a867bc5744c524d7/gpa.png)](https://codeclimate.com/repos/53cb2ea469568031fe01ad3f/feed)

Dolphy is an incredibly small (~200 LOC) web framework written in Ruby and based
on Rack. It was originally mimicking the behavior of Sinatra, but as time has
passed, it has slightly changed direction and is now more of a mix between
different web frameworks.

It has solely been written for the purpose of learning and is not meant to be
used in production.

There are a lot of things I want to do to improve the code and functionality of
this project. I try to list these things in the
[issues](https://github.com/majjoha/dolphy/issues). Feel free to fork this
repository and contribute if you want to help me implement features or fixing
bugs.

## Requirements
* Ruby 2.1.0 or newer.

## Getting started
Add this line to your Gemfile:

```ruby
gem 'dolphy'
```

And then run:

```
bundle
```

Or simply install it yourself as:

```
gem install dolphy
```

## Usage
```ruby
require 'dolphy'

Dolphy.app do
  setup do |app|
    # It is possible to specify the template engine in the config block. If no
    # template engine is specified, it will simply default to ERB.
    app.settings[:template_engine] = Dolphy::TemplateEngines::HamlEngine

    # You can also specify a view path where Dolphy will look for views. It is
    # by default set to `./views/`.
    app.settings[:view_path] = "./somewhere/else/views/"

    # Configurations are available to the rest of the application defined in the
    # router block, so we could for instance define a title. Basically, you can
    # give the settings hash any key value pair that you might find useful to
    # store for later use.
    app.settings[:title] = "Building things with Dolphy"
  end

  Dolphy.router do
    get '/' do
      render :index, { title: settings[:title], body: "Hello!" }
    end

    get '/login' do
      render :login
    end

    post '/post' do
      render :post, body: "hello #{params["message"]["name"]}"
    end

    get '/hello/:name' do |name|
      render :hello, name: name
    end
  end
end.serve!
```

## Inspiration
I've been looking in my directions for inspiration. I probably owe some credit
to [Camping](http://camping.io), [Cuba](http://cuba.is),
[NYNY](http://alisnic.github.io/nyny/), and obviously
[Sinatra](http://sinatrarb.com) and [Rails](http://rubyonrails.org).


## Contribute
1. [Fork it](https://github.com/majjoha/dolphy/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am 'Add some new feature.'`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create a new pull request.

## License
See [LICENSE](https://github.com/majjoha/dolphy/blob/master/LICENSE).
Copyright (c) 2014 Mathias Jean Johansen <<mathias@mjj.io>>
