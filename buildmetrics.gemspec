# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'buildmetrics/version'

Gem::Specification.new do |spec|
  spec.name          = "buildmetrics"
  spec.version       = Buildmetrics::VERSION
  spec.authors       = ["Solomon White"]
  spec.email         = ["rubysolo@gmail.com"]
  spec.summary       = %q{Buildmetrics}
  spec.description   = %q{Capture pass/fail/timing information from test suite}
  spec.homepage      = "https://github.com/rubysolo/buildmetrics"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
