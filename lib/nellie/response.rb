module Nellie
  module Response
    def self.create(response_hash)
     response_hash
    end

    attr_reader :pagination
    attr_reader :meta
    attr_reader :ratelimit
  end
end