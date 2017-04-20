module RBLoad
  module Worker
    class SingleRequest
      def initialize(url:)
        @url = url
      end

      def report_to(reporter)
        @reporter = reporter
      end

      def increase_users_by(number_of_users)
        fail 'Only allow one user' if number_of_users > 1
        @thread = @thread || Thread.new do
          loop do
            puts @url
            # TODO
            @reporter.notify_success
          end
        end
      end

      def shutdown_all_users
        Thread.kill @thread
      end

      def shutdown
        Thread.kill @thread
      end
    end
  end
end
