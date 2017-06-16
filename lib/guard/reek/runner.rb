# coding: utf-8

module Guard
  class Reek
    # This class runs `reek` command, retrieves result and notifies.
    # An instance of this class is intended to invoke `reek` only once in its lifetime.
    class Runner
      attr_reader :notifier, :ui, :result

      def initialize(options)
        @cli = options[:cli]
        @notifier = options[:notifier] || Notifier
        @ui = options[:ui] || UI
      end

      # this class decides which files are run against reek
      class Paths
        def initialize(paths)
          @paths = paths
          @paths = [] if @paths.include?('.reek')
          @paths = ['*'] if @paths.empty?
        end

        def to_s
          @paths == ['*'] ? 'all' : @paths.to_s
        end

        def to_ary
          @paths
        end
      end

      def run(paths = [])
        runner_paths = Paths.new(paths)
        ui.info("Guard::Reek is running on #{runner_paths}")

        command = reek_cmd.concat(runner_paths)
        @result = Kernel.system(command.join(' '))

        notify_about_result
      end

      private

      def reek_cmd
        ['reek', @cli].compact
      end

      def notify_about_result
        if result
          notifier.notify('Reek Results', title: 'Passed', image: :success)
        else
          notifier.notify('Reek Results', title: 'Failed', image: :failed)
        end
      end
    end
  end
end
