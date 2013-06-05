guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

guard :bundler do
  watch('Gemfile')
  watch('guard-reek.gemspec')
end

guard :reek  do
  watch("lib/guard/reek.rb")
  watch(/^lib\/.*\.rb$/)
end
