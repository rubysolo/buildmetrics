module Buildmetrics
  class StdoutStorage
    def store(build)
      puts "\n[Buildmetrics]"
      puts build
    end
  end
end
