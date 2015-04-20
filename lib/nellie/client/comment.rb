module Nellie
  class Client
    module Comment

      def get_comment(id)
        get("comments/#{id}")
      end

      def create_comment(post_id, text, moderator_id, opts = {})
        response = post("posts/#{post_id}/comments", text: text, moderator_id: moderator_id)
        response
      end

      def update_comment(id, text, opts = {})
        response = put("comments/#{id}", text: text)
        response
      end

      def like_comment(id, type, opts = {})
        response = post("comments/#{id}/likes", type: type)
        response
      end

      def unlike_comment(id, type, opts = {})
        response = delete("comments/#{id}/likes", type: type)
        response
      end

      def comment_likes(id, type, opts = {})
        response = get("comments/#{id}/likes", type: type)
        response
      end

    end
  end
end
