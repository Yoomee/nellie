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

  def test_it_can_get_bookmarked_posts
    VCR.use_cassette('bookmarked_posts') do
      client = Nellie::Client.new(access_token: '1761923a5fea9e2f35602df2a6bb336887d2ce2397639ab3474ab27013c6df22', refresh_token: 'access_token')
      client.store[:access_token] = client.access_token
      response = client.bookmarked_posts
      refute response.posts.nil?
      assert response.posts.count == 20
    end
  end

end
