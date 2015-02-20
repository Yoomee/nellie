require './test/test_helper'

class NelliePostTest < Minitest::Test

  def test_exists
    assert Nellie::Client::Users
  end

  def test_it_can_get_a_post
    VCR.use_cassette('single_post') do
      client = Nellie::Client.new(access_token: '3370c2b33fced602489ef13f1ac965423ee982cd014344b0c77d665cd62cdbe9', refresh_token: '4b9724b07b338ff6fb1da72819ac13dce181df26b017bacb8e29b4374cc05de2')
      client.store[:access_token] = client.access_token
      post = client.post(1)

      # puts post

      refute post.nil?
      # assert_equal "f6538b64f1790364ec95220265a0af02da14fbbe6fd94f633b68c161e4f34efd", token[:refresh_token]
    end
  end

end