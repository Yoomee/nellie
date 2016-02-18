module Nellie
  class Client
    module Comment

      def get_comment(id)
        get("comments/#{id}")
      end

      def create_comment(post_id, text, moderator_id, opts = {})
        opts[:text] = text
        opts[:moderator_id] = moderator_id
        post("posts/#{post_id}/comments", opts)
      end

      def update_comment(id, text, opts = {})
        opts[:text] = text
        put("comments/#{id}", opts)
      end

      def like_comment(id, type, opts = {})
        opts[:type] = type
        post("comments/#{id}/likes", opts)
      end

      def unlike_comment(id, type, opts = {})
        opts[:type] = type
        delete("comments/#{id}/likes", opts)
      end

      def comment_likes(id, type, opts = {})
        opts[:type] = type
        get("comments/#{id}/likes", opts)
      end

    end
  end
end
