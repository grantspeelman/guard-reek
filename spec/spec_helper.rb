require 'rubygems'
require 'simplecov'
SimpleCov.start

ENV['RUBY_ENV'] ||= 'test'

require 'bundler/setup'

SimpleCov.start do
  add_group 'Libs', 'lib'
  add_filter '/vendor/bundle/'
end

SimpleCov.minimum_coverage 98
SimpleCov.maximum_coverage_drop 2

# Initialize Guard for running tests.
require 'guard'
Guard.setup(notify: false)

require 'guard/reek'

RSpec.configure do |config|
end
