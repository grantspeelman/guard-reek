Guard::Reek  [![Build Status](https://travis-ci.org/gvillalta99/guard-reek.png?branch=master)](https://travis-ci.org/gvillalta99/guard-reek) [![Coverage Status](https://coveralls.io/repos/gvillalta99/guard-reek/badge.png)](https://coveralls.io/r/gvillalta99/guard-reek) [![Code Climate](https://codeclimate.com/github/gvillalta99/guard-reek.png)](https://codeclimate.com/github/gvillalta99/guard-reek) 
=========================
TODO: Write a gem description

## Installation

Please make sure to have [Guard](https://github.com/guard/guard) installed before continue.

Add `guard-reek` to your `Gemfile`:

```ruby
group :development do
  gem 'guard-reek'
end
```

and then execute:

```sh
$ bundle install
```

or install it yourself as:

```sh
$ gem install guard-reek
```

Add the default Guard::Reek definition to your `Guardfile` by running:

```sh
$ guard init reek
```

## Usage

Please read the [Guard usage documentation](https://github.com/guard/guard#readme).

## Options

You can pass some options in `Guardfile` like the following example:

```ruby
guard :reek, all_on_start: false, run_all: false do
  # ...
end
```

### Available Options

```
all_on_start: true     # Check all files at Guard startup.
                       #   default: true
run_all: true          # Check all files on "Enter"
                       #   default: true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
