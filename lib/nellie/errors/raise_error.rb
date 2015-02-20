module Nellie
  module Errors
    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        raise Nellie::Errors::Unauthorized if env[:status] == 401
      end

    end
  end
end