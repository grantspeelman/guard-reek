# coding: utf-8

module Guard
  class Reek
    # This class runs `reek` command, retrieves result and notifies.
    # An instance of this class is intended to invoke `reek` only once in its lifetime.
    class Runner
      attr_reader :notifier, :ui, :result

      def initialize(options)
        @options = options
        @notifier = options[:notifier] || Notifier
        @ui = options[:ui] || UI
      end

      def run(paths = [])
        paths = [] if paths.include?('.reek')
        ui_message(paths)

        command = ['reek'].concat(paths)
        @result = Kernel.system(*command)

        notify_about_result
      end

      private

      def ui_message(paths)
        if paths.empty?
          ui.info('Guard::Reek running on all')
        else
          ui.info("Guard::Reek is running on #{paths}")
        end
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
