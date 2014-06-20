require 'buildmetrics/rspec_collector'
require 'pry-nav'
require 'stringio'

build  = ENV['TRAVIS_BUILD_NUMBER'] || Time.now.strftime('%Y%m%d%H%M%S')
repo   = ENV['REPO']                || 'rubysolo/buildmetrics'
branch = ENV['TRAVIS_BRANCH']       || `git branch`.split("\n").select { |b| b[0] == '*' }.first.to_s.gsub('* ', '')
commit = ENV['TRAVIS_COMMIT']       || `git log -1 --pretty=format:'%H'` rescue 'HEAD'

collector = Buildmetrics::RSpecCollector.new(build, repo, branch, commit)

RSpec.configure do |config|
  config.before(:each) do
    $stdout = StringIO.new
  end

  config.after(:each) do
    $stdout = STDOUT
  end

  config.after(:each) do |group|
    collector.collect(group)
  end

  config.after(:suite) do
    collector.store
  end
end
