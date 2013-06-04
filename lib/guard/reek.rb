require 'guard'
require 'guard/guard'

module Guard
  class Reek < Guard
    SUCCESS = ["Passed", { title: "Passed", image: :success }]
    FAILED = ["Failed", { title: "Failed", image: :failed }]

    attr_reader :last_result, :options

    def initialize(watchers = [], options = {})
      super
      @options = options
      @files = []
      watchers.each do |watcher|
        @files += Dir[watcher.pattern]
      end
    end

    def start
      UI.info "Guard::Reek is running"
      run_all
    end

    def run_all
      reek @files
    end

    def run_on_changes(paths)
      binding.pry
      reek paths
    end

    def reek(paths)
      result = system command(paths)

      if result
        Notifier.notify(*SUCCESS)
      else
        Notifier.notify(*FAILED)
      end

      @last_result = result
      result
    end

    def command paths
      "reek #{paths.join(' ')}"
    end
  end
end
