require 'faraday'
require File.expand_path('../raise_error', __FILE__)

module Nellie
  module Errors

    # Custom error class for rescuing from all Elefriends errors
    class Error < StandardError; end

    # Raised when Nellie returns the HTTP status code 401
    class Unauthorized < Error; end

    class InvalidFacebookToken < Error; end

    class NotFound < Error; end

    class NotValid < Error; end

  end
end
