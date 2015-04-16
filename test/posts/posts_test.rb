require './test/test_helper'

class NelliePostsTest < Minitest::Test

  def test_exists
    assert Nellie::Client::Users
  end

  def test_it_can_get_feedback_posts
    VCR.use_cassette('feedback_posts') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'access_token')
      client.store[:access_token] = client.access_token
      response = client.feedback_posts
      refute response.posts.nil?
      assert response.posts.count == 20
    end
  end

end
