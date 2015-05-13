module Nellie
  module Errors
    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        raise Nellie::Errors::Unauthorized if env[:status] == 401
        raise Nellie::Errors::NotFound if env[:status] == 404
      end

    end
  end
end