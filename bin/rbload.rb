#!/usr/bin/env ruby

require_relative '../lib/rbload'
require_relative '../lib/worker/single_request_worker'
require_relative '../lib/strategy/one_user_fixed_tries_strategy'
require_relative '../lib/reporter/inmemory_reporter'

optparse = OptionParser.new do|opts|
  opts.banner = "Usage: rbload.rb [options]"

  opts.on( '-s', '--standalone', 'Use standalone worker mode' ) do
    puts 'standalone'
  end
end

optparse.parse!

test = RBLoad::LoadTest.new(worker: RBLoad::Worker::SingleRequestWorker.new(url: 'www.google.com.br'),
                            strategy: RBLoad::Strategy::OneUserFixedTriesStrategy.new,
                            reporter: RBLoad::Reporter::InMemoryReporter.new)
test.start
