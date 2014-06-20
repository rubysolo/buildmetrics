require 'spec_helper'
require 'buildmetrics/http_storage'

describe Buildmetrics::HttpStorage do
  let(:url) { 'http://buildmetrics.example.com/builds' }

  it 'posts input to an endpoint' do
    storage = described_class.new(url)
    message = {}

    http = double
    expect(Net::HTTP).to receive(:new).with('buildmetrics.example.com', 80).and_return(http)
    expect(http).to receive(:start).and_yield(http)
    expect(http).to receive(:request)

    storage.store(message)
  end
end
