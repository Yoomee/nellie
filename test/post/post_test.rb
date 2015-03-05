require './test/test_helper'

class NelliePostTest < Minitest::Test

  def test_exists
    assert Nellie::Client::Users
  end

  def test_it_can_get_a_post
    VCR.use_cassette('single_post') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'refresh_token')
      client.store[:access_token] = client.access_token
      post = client.post(1)

      refute post.nil?
    end
  end

  def test_it_can_get_a_users_latest_post
    VCR.use_cassette('users_single_post') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'refresh_token')
      client.store[:access_token] = client.access_token
      posts = client.user_posts(1, count: 1)
      refute posts.nil?
    end
  end

end