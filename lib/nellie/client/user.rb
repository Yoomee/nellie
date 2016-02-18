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
        get("users/latest", opts)
      end

      def user_wall(id, opts = {})
        get("users/#{id}/wall", opts)
      end

      def private_activity(id, opts = {})
        get("users/#{id}/private_activity", opts)
      end

      def follow_user(id, opts = {})
        post("users/#{id}/follow", opts)
      end

      def unfollow_user(id, opts = {})
        post("users/#{id}/unfollow", opts)
      end

      def user_pins(opts = {})
        get("users/pins", opts)
      end

      def search(text, opts = {})
        opts['text'] = text
        get("users/search", opts)
      end

    end
  end
end
