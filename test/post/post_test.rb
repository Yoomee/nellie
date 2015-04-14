require './test/test_helper'

class NelliePostTest < Minitest::Test

  def test_exists
    assert Nellie::Client::Users
  end

  def test_it_can_get_a_post
    VCR.use_cassette('single_post') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'refresh_token')
      client.store[:access_token] = client.access_token
      post = client.get_post(1)

      refute post.nil?
    end
  end

  def test_it_can_get_a_users_latest_post
    VCR.use_cassette('users_single_post') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'access_token')
      client.store[:access_token] = client.access_token
      response = client.user_posts(1, count: 1)

      refute response.posts.nil?
      assert response.posts.count == 1
    end
  end

  def test_it_can_get_a_posts_comments
    VCR.use_cassette('posts_comments') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'access_token')
      client.store[:access_token] = client.access_token
      response = client.post_comments(1)

      refute response.comments.nil?
      assert response.comments.count == 5
      refute response.comments[0].user.nil?
    end
  end

  def test_it_can_get_a_posts_interactions
    VCR.use_cassette('posts_interactions') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'access_token')
      client.store[:access_token] = client.access_token
      response = client.post_interactions(1)
      refute response.interactions.nil?
      assert response.interactions.count == 2
      refute response.interactions[0].user.nil?
    end
  end

end
