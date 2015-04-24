require './test/test_helper'

class NelliePostTest < Minitest::Test

  def test_exists
    assert Nellie::Client::Comment
  end

  def test_it_can_create_a_comment
    VCR.use_cassette('create_comment') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'refresh_token')
      client.store[:access_token] = client.access_token
      response = client.create_comment(1, "Some text", nil)

      refute response.comment.nil?
      assert response.comment.class == Hashie::Mash
      assert response.comment.text == "Some text"
    end
  end

  def test_it_can_update_a_comment
    VCR.use_cassette('update_comment') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'refresh_token')
      client.store[:access_token] = client.access_token
      response = client.update_comment(1, "New text")

      refute response.comment.nil?
      assert response.comment.class == Hashie::Mash
      assert response.comment.text == "New text"
    end
  end

  def test_it_can_like_a_comment
    VCR.use_cassette('like_comment') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'refresh_token')
      client.store[:access_token] = client.access_token
      response = client.like_comment(1, "like")

      refute response.like.nil?
      assert response.like.like_type == "like"
      assert response.like.resource_type == "Comment"
    end
  end

  def test_it_can_unlike_a_comment
    VCR.use_cassette('unlike_comment') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'refresh_token')
      client.store[:access_token] = client.access_token
      response = client.unlike_comment(1, "like")
      assert response.nil?
    end
  end

  def test_it_can_get_a_comment
    VCR.use_cassette('get_comment') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'refresh_token')
      client.store[:access_token] = client.access_token
      response = client.get_comment(1)
      refute response.nil?
    end
  end

end
