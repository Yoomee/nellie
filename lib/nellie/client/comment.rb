module Nellie
  class Client
    module Comment

      def get_comment(id)
        get("comments/#{id}")
      end

      def create_comment(post_id, text, moderator_id, opts = {})
        post("posts/#{post_id}/comments", text: text, moderator_id: moderator_id, opts)
      end

      def update_comment(id, text, opts = {})
        put("comments/#{id}", text: text, opts)
      end

      def like_comment(id, type, opts = {})
        post("comments/#{id}/likes", type: type, opts)
      end

      def unlike_comment(id, type, opts = {})
        delete("comments/#{id}/likes", type: type, opts)
      end

      def comment_likes(id, type, opts = {})
        get("comments/#{id}/likes", type: type, opts)
      end

    end
  end
end
