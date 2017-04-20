module RBLoad
  module Reporter
    class InMemory
      attr_reader :total_executions, :successes

      def initialize
        @total_executions = 0
        @successes = 0
      end

      def notify_success
        @total_executions += 1
        @successes += 1
      end

      def notify_failure
        @total_executions += 1
      end

      def failures
        @total_executions - @successes
      end

      def flush
        puts "Total executions: #{@total_executions}. Efectivity of #{efectivity}%."
      end

      def efectivity
        return 100 if @total_executions == 0
        100 * @successes / @total_executions
      end
    end
  end
end
