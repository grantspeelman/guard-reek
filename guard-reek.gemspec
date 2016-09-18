# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'guard/reek/version'

Gem::Specification.new do |gem|
  gem.name          = "guard-reek"
  gem.version       = Guard::ReekVersion.to_s
  gem.authors       = ["Gustavo Villalta"]
  gem.email         = ["gvillalta99@gmail.com"]
  gem.description   = %q{Guard::Reek automatically runs Reek when files change}
  gem.summary       = %q{Guard plugin for Reek}
  gem.homepage      = "https://github.com/gvillalta99/guard-reek"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|gem|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'reek'
  gem.add_dependency 'guard-compat', '~> 1.1'

  gem.add_development_dependency 'ruby_dep', '~> 1.3.0'
  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "guard-bundler"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "rspec", "~> 3.0"
  gem.add_development_dependency "rake"
end
