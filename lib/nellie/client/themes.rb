module Nellie
  class Client
    module Themes

      def theme_posts(theme_id, opts={})
        response = get("themes/#{theme_id}/posts", opts)
        response
      end
    end
  end
end
