module RBLoad
  module Rhythm
    class SimpleSleep
      def initialize(silence_time: 1)
        @silence_time = silence_time
      end

      def silence_time
        sleep @silence_time
      end
    end
  end
end
