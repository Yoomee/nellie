module Nellie
  class Client
    module Comment

      def create_comment(post_id, text, opts = {})
        response = post("posts/#{post_id}/comments", text: text)
        response
      end

      def update_comment(id, text, opts = {})
        response = put("comments/#{id}", text: text)
        response
      end

    end
  end
end
