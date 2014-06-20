require 'spec_helper'
require 'buildmetrics/stdout_storage'

describe Buildmetrics::StdoutStorage do
  it 'dumps input to stdout' do
    subject.store("hello")
    expect($stdout.string).to eq "\n[Buildmetrics]\nhello\n"
  end
end
