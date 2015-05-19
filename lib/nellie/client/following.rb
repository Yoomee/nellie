module Nellie
  class Client
    module Following

      def following_posts(opts)
        response = get("following/posts", opts)
        response
      end

    end
  end
end
