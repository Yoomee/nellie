module Nellie
  class Client
    module Posts

      def post(id)
        response = get("posts/#{id}")
        response
      end

      # Returns a list of posts for a given user ID
      #
      # @overload user_posts(id)
      #   @param id [Integer] An Elefriends user ID
      #   @return [Hash] The requested posts.
      #   @example Returns a list of posts for the user id of ID 1234
      #     Nellie.user_posts(1234)
      # @format :json
      # @authenticated true
      def user_posts(id, *opts)
        response = get("users/#{id}/posts", opts)
        response
      end

    end
  end
end
