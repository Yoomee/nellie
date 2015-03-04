module Nellie
  class Client
    module Users

        def login(username, password)
          client = OAuth2::Client.new(Nellie.client_id, Nellie.client_secret, :site => "http://localhost:3001")
          return client.password.get_token(username, password).to_hash
        end

    end
  end
end
