# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nellie/version'

Gem::Specification.new do |spec|
  spec.name          = "nellie"
  spec.version       = Nellie::VERSION
  spec.authors       = ["Yoomee"]
  spec.email         = ["developers@yoomee.com"]
  spec.summary       = %q{A little gem to wrap the Elfriends API}
  spec.description   = %q{A little gem to wrap the Elfriends API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "byebug"

  spec.add_dependency "faraday", "<= 0.9.1"
  spec.add_dependency "faraday_middleware"
  spec.add_runtime_dependency "hashie"
  spec.add_dependency "json"
  spec.add_dependency "oauth2", "~> 1.0"
  spec.add_dependency "retriable"

end
