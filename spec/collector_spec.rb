require 'spec_helper'
require 'buildmetrics/rspec_collector'

describe Buildmetrics::RSpecCollector do
  let(:group) { double(
    full_description: 'assert the truth',
    exception: nil,
    execution_result: double(started_at: Time.now)
  )}

  let(:collector) { described_class.new('build-123', 'user/repo', 'master', 'SHA') }

  it 'collects test run data' do
    collector.collect(group)
    expect(collector.tests.length).to eq 1

    result = collector.tests.first
    expect(result.name).to eq 'assert the truth'
    expect(result.passed).to be
  end

  it 'serializes to hash' do
    collector.collect(group)
    result = collector.to_h

    expect(result[:build]).to eq 'build-123'
    expect(result[:repo]).to eq 'user/repo'
    expect(result[:commit]).to eq 'SHA'

    expect(result[:tests].length).to eq 1
  end
end
