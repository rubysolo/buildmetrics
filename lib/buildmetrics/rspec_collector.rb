require_relative 'stdout_storage'

module Buildmetrics
  class RSpecCollector
    attr_reader :tests
    attr_accessor :storage

    def initialize(build, repo, branch, commit, storage: StdoutStorage.new)
      @build   = build
      @repo    = repo
      @branch  = branch
      @commit  = commit
      @tests   = []
      @storage = storage
    end

    Test = Struct.new(:name, :passed, :elapsed_time)

    def collect(group)
      elapsed_time = Time.now.to_f - group.execution_result.started_at.to_f
      @tests << Test.new(group.full_description, ! group.exception, elapsed_time)
    end

    def to_h
      {
        build:  @build,
        repo:   @repo,
        branch: @branch,
        commit: @commit,
        tests:  @tests.map { |t| t.to_h }
      }
    end

    def store
      storage.store(to_h)
    end
  end
end
