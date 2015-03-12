require './lib/nellie'
require 'minitest/autorun'
require "minitest/reporters"
require 'webmock/minitest'
require 'vcr'
require 'oauth2'
require 'byebug'

Minitest::Reporters.use!

VCR.configure do |c|
  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end
