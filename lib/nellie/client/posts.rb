module Nellie
  class Client
    module Posts

      def get_post(id)
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
      def user_posts(id, opts)
        response = get("users/#{id}/posts", opts)
        response
      end

      # Returns a list of posts
      #
      # @overload user_posts(id)
      #   @return [Hash] The requested posts.
      #   @example Returns a list of posts for the user id of ID 1234
      #     Nellie.user_posts(1234)
      # @format :json
      # @authenticated true
      def posts(opts)
        response = get("posts", opts)
        response
      end

      def like_post(id, opts = {})
        response = post("posts/#{id}/likes", opts)
        response
      end

      def unlike_post(id, opts = {})
        response = delete("posts/#{id}/likes", opts)
        response
      end

      def post_comments(id, opts = {})
        response = get("posts/#{id}/comments", opts)
        response
      end

      def post_interactions(id, opts = {})
        response = get("posts/#{id}/interactions", opts)
        response
      end

      def update_post(id, text, opts = {})
        response = put("posts/#{id}", {text: text}, opts)
        response
      end

      def elephant_post(opts = {})
        response = get("posts/elephant_post", opts)
        response
      end

      def moderator_posts(opts = {})
        response = get("posts/moderator_wall", opts)
        response
      end

      def unmoderated_posts(opts = {})
        response = get("posts/unmoderated", opts)
        response
      end

      def feedback_posts(opts = {})
        response = get("posts/feedback_wall", opts)
        response
      end

      def bookmarked_posts(opts = {})
        response = get("posts/bookmarked_wall", opts)
        response
      end

    end
  end
end
