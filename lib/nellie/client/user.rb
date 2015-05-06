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
          return client.assertion.get_token(iss: 'http://localhost:3000', prn: token, :exp => Time.now.utc.to_i + 3600, hmac_secret: '1234').to_hash
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

      def private_activity(id, opts = {})
        response = get("users/#{id}/private_activity", opts)
        response
      end

      def follow_user(id, opts = {})
        response = post("users/#{id}/follow", opts)
        response
      end

      def unfollow_user(id, opts = {})
        response = post("users/#{id}/unfollow", opts)
        response
      end

      def user_pins(opts = {})
        response = get("users/pins", opts)
        response
      end

    end
  end
end
