#!/usr/bin/env ruby

require_relative '../lib/rbload'
require_relative '../lib/worker/single_request'
require_relative '../lib/strategy/one_user_fixed_tries'
require_relative '../lib/reporter/inmemory'

optparse = OptionParser.new do|opts|
  opts.banner = "Usage: rbload.rb [options]"

  opts.on( '-s', '--standalone', 'Use standalone worker mode' ) do
    puts 'standalone'
  end
end

optparse.parse!

test = RBLoad::LoadTest.new(worker: RBLoad::Worker::SingleRequest.new(url: 'www.google.com.br'),
                            strategy: RBLoad::Strategy::OneUserFixedTries.new,
                            reporter: RBLoad::Reporter::InMemory.new)
test.start
