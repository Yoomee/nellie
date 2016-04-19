require 'faraday'
require File.expand_path('../raise_error', __FILE__)

module Nellie
  module Errors

    # Custom error class for rescuing from all Elefriends errors
    class Error < StandardError; end

    # Custom error classes for error'd API responses
    class ApiError < Error
      attr_reader :status
      attr_reader :headers
      attr_reader :body

      def initialize(status, headers, body)
        @status = status
        @headers = headers
        @body = body
      end
    end

    # Raised when Nellie returns the HTTP status code 401
    class Unauthorized < ApiError; end

    class AccessDenied < ApiError; end

    class InvalidFacebookToken < ApiError; end

    class NotFound < ApiError; end

    class NotValid < ApiError; end

  end
end
