module Nellie
  module Errors
    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        raise Nellie::Errors::Unauthorized.new(env.status, env.response_headers, JSON.parse(env.body)) if env[:status] == 401
        raise Nellie::Errors::NotFound.new(env.status, env.response_headers, JSON.parse(env.body)) if env[:status] == 404
        raise Nellie::Errors::NotValid.new(env.status, env.response_headers, JSON.parse(env.body)) if env[:status] == 422
      end

    end
  end
end
