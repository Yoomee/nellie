module Nellie
  # Wrapper for the Elefriends REST API
  #
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    def self.from_hash(hash)
      new(access_token: hash['access_token'], refresh_token: hash['refresh_token'])
    end

    include Nellie::Client::Users
    include Nellie::Client::Posts
  end
end