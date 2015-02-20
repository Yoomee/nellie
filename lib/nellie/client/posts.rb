module Nellie
  class Client
    module Posts

      def post(id)
        response = get("posts/#{id}")
        response
      end

    end
  end
end
