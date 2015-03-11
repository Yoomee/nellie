Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module Nellie
  # @private
  module Connection
    private

    def connection(raw=false)
      options = {
        :headers => {'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent},
        :proxy => proxy,
        :url => endpoint,
        }.merge(connection_options)

      Faraday::Connection.new(options) do |connection|
        check = lambda { |env,exception| authorization_error_handler(env, exception) }
        connection.use Nellie::Errors::RaiseError
        connection.use FaradayMiddleware::Mashify
        connection.use Faraday::Response::ParseJson
        connection.request :oauth2, store[:access_token]
        connection.adapter(adapter)
      end
    end

  end
end
