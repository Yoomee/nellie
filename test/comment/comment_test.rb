require './test/test_helper'

class NelliePostTest < Minitest::Test

  def test_exists
    assert Nellie::Client::Comment
  end

  def test_it_can_create_a_comment
    VCR.use_cassette('create_comment') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'refresh_token')
      client.store[:access_token] = client.access_token
      response = client.create_comment(1, "Some text")

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

end