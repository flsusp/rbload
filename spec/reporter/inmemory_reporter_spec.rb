require 'rspec'
require_relative '../../lib/reporter/inmemory_reporter'

describe RBLoad::Reporter::InMemoryReporter do
  let(:reporter) { RBLoad::Reporter::InMemoryReporter.new }

  context 'on initialization' do
    it 'total executions should be zero' do
      expect(reporter.total_executions).to be 0
    end
    it 'successes should be zero' do
      expect(reporter.successes).to be 0
    end
    it 'failures should be zero' do
      expect(reporter.failures).to be 0
    end
    it 'efectivity should be 100%' do
      expect(reporter.efectivity).to be 100
    end
  end

  context 'after one success' do
    before { reporter.notify_success }

    it 'total executions should be one' do
      expect(reporter.total_executions).to be 1
    end
    it 'successes should be one' do
      expect(reporter.successes).to be 1
    end
    it 'failures should be zero' do
      expect(reporter.failures).to be 0
    end
    it 'efectivity should be 100%' do
      expect(reporter.efectivity).to be 100
    end
  end

  context 'after one failure' do
    before { reporter.notify_failure }

    it 'total executions should be one' do
      expect(reporter.total_executions).to be 1
    end
    it 'successes should be zero' do
      expect(reporter.successes).to be 0
    end
    it 'failures should be one' do
      expect(reporter.failures).to be 1
    end
    it 'efectivity should be 0%' do
      expect(reporter.efectivity).to be 0
    end
  end

  context 'after one success and one failure' do
    before do
      reporter.notify_success
      reporter.notify_failure
    end

    it 'total executions should be two' do
      expect(reporter.total_executions).to be 2
    end
    it 'successes should be one' do
      expect(reporter.successes).to be 1
    end
    it 'failures should be one' do
      expect(reporter.failures).to be 1
    end
    it 'efectivity should be 50%' do
      expect(reporter.efectivity).to be 50
    end
  end
end
