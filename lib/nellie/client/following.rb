module Nellie
  class Client
    module Following

      def following_posts(id)
        response = get("following/posts")
        response
      end

    end
  end
end
