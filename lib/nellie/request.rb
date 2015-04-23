module Nellie
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options={}, signature=false, raw=false, unformatted=false, no_response_wrapper=no_response_wrapper)
      request(:get, path, options, signature, raw, unformatted, no_response_wrapper)
    end

    # Perform an HTTP POST request
    def post(path, options={}, signature=false, raw=false, unformatted=false, no_response_wrapper=no_response_wrapper)
      request(:post, path, options, signature, raw, unformatted, no_response_wrapper)
    end

    # Perform an HTTP PUT request
    def put(path, options={},  signature=false, raw=false, unformatted=false, no_response_wrapper=no_response_wrapper)
      request(:put, path, options, signature, raw, unformatted, no_response_wrapper)
    end

    # Perform an HTTP DELETE request
    def delete(path, options={}, signature=false, raw=false, unformatted=false, no_response_wrapper=no_response_wrapper)
      request(:delete, path, options, signature, raw, unformatted, no_response_wrapper)
    end

  private

    def refresh_access_token
      Proc.new do |exception, try, elapsed_time, next_interval|
        puts "Access token not valid"
        puts "Trying to get a new one"
        client = OAuth2::Client.new(Nellie.client_id, Nellie.client_secret, :site => Nellie.endpoint)
        if store[:refresh_token].present?
          #The user logged in with a user name and password, get a new token using the refresh token
          token = refresh_token_with_refresh_token(client, store[:access_token], store[:refresh_token])
          store[:access_token] = token.token
          store[:refresh_token] = token.refresh_token
        else
          #The user logged in with facebook, get a new token with the facebook token
          token = refresh_token_with_facebook(client, store[:facebook_token])
          store[:access_token] = token[:access_token]
        end
      end
    end

    def refresh_token_with_refresh_token(client, access_token, refresh_token)
      token = OAuth2::AccessToken.new(client, access_token, refresh_token)
      client.assertion.get_token(hmac_secret: token).to_hash
      token.refresh!
    end

    def refresh_token_with_facebook(client, facebook_token)
      client.assertion.get_token(hmac_secret: facebook_token).to_hash
    end

    # Perform an HTTP request
    def request(method, path, options, signature=false, raw=false, unformatted=false, no_response_wrapper=false)
      begin
        Retriable.retriable on: Nellie::Errors::Unauthorized, on_retry: refresh_access_token  do
          response = connection(raw).send(method) do |request|

            # path = formatted_path(path) unless unformatted
            case method
            when :get, :delete
              request.url(path, options)
            when :post, :put
              request.path = path
              request.body = options unless options.empty?
            end
          end
          return response if raw
          return response.body if no_response_wrapper
          return Response.create(response.body)
        end
      rescue Nellie::Errors::Unauthorized
        raise
      end
    end

    def formatted_path(path)
      [path, format].compact.join('.')
    end
  end
end
