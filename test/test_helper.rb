require './lib/nellie'
require 'minitest/autorun'
require "minitest/reporters"
require 'webmock/minitest'
require 'vcr'
require 'oauth2'
require 'byebug'

Minitest::Reporters.use!

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end
