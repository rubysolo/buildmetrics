require 'json'

module Buildmetrics
  class HttpStorage
    attr_reader :uri

    def initialize(url)
      @uri = URI.parse(url)
    end

    def store(build)
      req = Net::HTTP::Post.new(@uri.path, {'Content-Type' =>'application/json'})
      req.body = build.to_json
      Net::HTTP.new(@uri.host, @uri.port).start { |http| http.request(req) }
    end
  end
end
