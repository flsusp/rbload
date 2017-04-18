require_relative 'rhythmist/simple_sleep'

module RBLoad
  class LoadTest
    attr_reader :rhythmist
    def initialize(worker:, strategy:, reporter:, rhythmist: RBLoad::Rhythm::SimpleSleep.new)
      @worker = worker
      @strategy = strategy
      @reporter = reporter
      @rhythmist = rhythmist
    end

    def start
      @worker.report_to @reporter
      @strategy.report_to @reporter
      @strategy.start @worker
      begin
        @strategy.continue
        @rhythmist.silence_time
      end until @strategy.finished?
      @worker.shutdown
      @reporter.flush
    end
  end
end
