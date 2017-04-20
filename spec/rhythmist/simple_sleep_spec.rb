require 'rspec'
require_relative '../../lib/rhythmist/simple_sleep'

describe RBLoad::Rhythm::SimpleSleep do
  let(:rhythmist) { RBLoad::Rhythm::SimpleSleep.new(silence_time: 10) }

  it 'should sleep for the given time' do
    expect_any_instance_of(Object).to receive(:sleep).with(10)
    rhythmist.silence_time
  end
end
