require 'json'

module Buildmetrics
  class HttpStorage
    attr_reader :uri

    def initialize(url, headers={})
      @headers = headers
      @uri = URI.parse(url)
    end

    def store(build)
      req = Net::HTTP::Post.new(@uri.path, headers)
      req.body = build.to_json
      Net::HTTP.new(@uri.host, @uri.port).start { |http| http.request(req) }
    end

    def headers
      @headers.update('Content-Type' => 'application/json')
    end
  end
end
