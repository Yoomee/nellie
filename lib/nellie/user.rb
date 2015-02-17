require 'rest-client'
require 'json'
require 'oauth2'

API_URL = "http://localhost:3000/api/v1/sessions"

module Nellie
  class User
    def self.login(username, password)
      client_id = 'a15ed67d5df54109db045cd174650c43fd0f310ed3ead5c7db2df379c52ffbb3'
      client_secret = 'cd7b0f2380bc7414272c556d79738d97cab069f2a12cc750cdc816be89e16592'
      client = OAuth2::Client.new(client_id, client_secret, :site => "http://localhost:3001")
      return client.password.get_token(username, password)
    end
  end
end
