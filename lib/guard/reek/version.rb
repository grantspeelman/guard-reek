# coding: utf-8

module Guard
  # A workaround for declaring `class RuboCop`
  # before `class Reek < Guard` in reek.rb
  module ReekVersion
    # http://semver.org/
    MAJOR = 1
    MINOR = 0
    PATCH = 1

    def self.to_s
      [MAJOR, MINOR, PATCH].join('.')
    end
  end
end
