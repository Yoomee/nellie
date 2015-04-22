module Nellie
  class Client
    module Users

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def login(username, password)
          client = OAuth2::Client.new(Nellie.client_id, Nellie.client_secret, :site => Nellie.endpoint, :raise_errors  => false)
          return client.password.get_token(username, password).to_hash
        end

        def facebook_login(token)
          client = OAuth2::Client.new(Nellie.client_id, Nellie.client_secret, site: Nellie.endpoint, raise_errors: false)
          return client.assertion.get_token(hmac_secret: token).to_hash
        end
      end

      def latest_users(opts = {})
        response = get("users/latest", opts)
        response
      end

      def user_wall(id, opts = {})
        response = get("users/#{id}/wall", opts)
        response
      end

    end
  end
end
