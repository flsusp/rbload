module RBLoad
  module Strategy
    class OneUserFixedTriesStrategy
      def initialize(number_of_tries: 1)
        @number_of_tries = number_of_tries
      end

      def report_to(reporter)
        @reporter = reporter
      end

      def start(worker)
        @worker = worker
        @worker.increase_users_by 1
      end

      def continue
        @worker.shutdown_all_users if finished?
      end

      def finished?
        @reporter.total_executions >= 1
      end
    end
  end
end
