module Nellie
  class Client
    module Users

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def login(username, password)
          client = OAuth2::Client.new(Nellie.client_id, Nellie.client_secret, :site => Nellie.endpoint)
          return client.password.get_token(username, password).to_hash
        end
      end

      def latest_users(opts = {})
        response = get("users/latest", opts)
        response
      end

    end
  end
end
