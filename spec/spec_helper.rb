require 'coveralls'
Coveralls.wear!

ENV['RUBY_ENV'] ||= 'test'

require 'simplecov'

SimpleCov.start do
  add_group "Libs", "lib"
end

SimpleCov.minimum_coverage 98
SimpleCov.maximum_coverage_drop 2

require 'guard/reek'

RSpec.configure do |config|
end
