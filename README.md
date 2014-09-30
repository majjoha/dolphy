# Dolphy
[![Gem Version](https://badge.fury.io/rb/dolphy.svg)](http://badge.fury.io/rb/dolphy)
[![Build Status](https://travis-ci.org/majjoha/dolphy.svg)](https://travis-ci.org/majjoha/dolphy)
[![Code Climate](https://codeclimate.com/repos/53cb2ea469568031fe01ad3f/badges/a7a6a867bc5744c524d7/gpa.png)](https://codeclimate.com/repos/53cb2ea469568031fe01ad3f/feed)
[![Coverage Status](https://img.shields.io/coveralls/majjoha/dolphy.svg)](https://coveralls.io/r/majjoha/dolphy)

Dolphy is an incredibly small (~200 LOC) web framework written in Ruby and based
on Rack. It was originally mimicking the behavior of Sinatra, but as time has
passed, it has slightly changed direction and is now more of a mix between
different web frameworks.

It has solely been written for the purpose of learning and is not meant to be
used in production.

There are a lot of things I want to do to improve the code and functionality of
this project. I try to list these things in the
[issues](https://github.com/majjoha/dolphy/issues). Feel free to fork this
repository and contribute if you want to help me implement features or fix
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

Create a file `app.rb`:

```ruby
require 'dolphy'

Dolphy.app do
  Dolphy.router do
    get '/' do
      "Hello, world!"
    end
  end
end.serve!
```

Run the file:

```
ruby app.rb
```

Open the browser at [http://localhost:8080](http://localhost:8080).

## Usage
* [Setup blocks](#setup-blocks)
* [Template engines](#template-engines)
* [Routes](#routes)

### Setup blocks
A Dolphy application has a couple of default configurations that you can change
based on your needs through the `setup` block.

It uses the `Dolphy::TemplateEngines::ErbEngine` by default, and it uses
`./views/` to find the view files it needs. These can be configured in this way:

```ruby
require 'dolphy'

Dolphy.app do
  setup do |app|
    app.settings[:template_engine] = Dolphy::TemplateEngines::HamlEngine
    app.settings[:view_path] = "./somewhere/else/views/"
  end

  Dolphy.router do
    get '/' do
      "Hello, world!"
    end
  end
end.serve!
```

Since the `Dolphy::Settings` is basically just a hash, we can read from and
write to, we can also define our own settings to use in the views. We could for
instance define a title for a page by adding `app.settings[:title] = "Building
things with Dolphy"` in the `setup` block, which we can access in this way:

```ruby
Dolphy.app do
  setup do |app|
    app.settings[:title] = "Building things with Dolphy"
  end

  Dolphy.router do
    get '/' do
      render :index, title: settings[:title]
    end
  end
end.serve!
```

### Template engines
Dolphy supports Haml and ERB by default through the
`Dolphy::TemplateEngines::HamlEngine` and `Dolphy::TemplateEngine::ErbEngine`
(which relies on Tilt under the hood), but we can effortlessly build our own
template engines and use these in our application.

A template engine should have a `.render` method with three arguments: a
`template_name`, a hash with `locals` and finally a `view_path`.

Imagine we want our views to use [Liquid](http://liquidmarkup.org/), then we
just need to define a new `LiquidEngine` and make it our template engine in the
`setup` block:

```ruby
class LiquidEngine
  def self.render(template_name, locals = {}, view_path = "./views/")
    path = File.expand_path("#{view_path}#{template_name.to_s}.html", Dir.pwd)
    template = Tilt::LiquidTemplate.new(path)
    template.render(Object.new, locals)
  end
end
```

```ruby
Dolphy.app do
  setup do |app|
    app.settings[:template_engine] = LiquidEngine
  end

  Dolphy.router do
    get '/' do
      render :new_page
    end
  end
end.serve!
```

### Routes
The routing layer should look familiar if you've already worked with other Ruby
frameworks. We can override routes with variables by adding a new route, and we
use `:name` to access variables in the routes:

```ruby
require 'dolphy'

Dolphy.app do
  Dolphy.router do
    get '/hello/:name' do |name|
      render :hello, name: name
    end

    get '/hello/you'
      render :hello_you
    end
  end
end.serve!
```

In this case, any request to `/hello/bob` will render the `hello` template with
the `name` variable set to `"bob"`, while any request to `/hello/you` will
simply just render the `hello_you` template. The opposite order will not work,
so the ordering is quite important.

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
