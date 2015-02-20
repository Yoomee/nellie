require File.expand_path('../nellie/errors/errors', __FILE__)
require File.expand_path('../nellie/configuration', __FILE__)
require File.expand_path('../nellie/api', __FILE__)
require File.expand_path('../nellie/client', __FILE__)
require File.expand_path('../nellie/response', __FILE__)

require 'OAuth2'

module Nellie
  extend Configuration

  # Alias for Nellie::Client.new
  #
  # @return [Nellie::Client]
  def self.client(options={})
    Nellie::Client.new(options)
  end
end
