require './test/test_helper'

class NellieUserTest < Minitest::Test

  def test_exists
    assert Nellie::Client::Users
  end

  def test_it_logs_in_the_user
    VCR.use_cassette('user_token') do
      token = Nellie::Client.login("greg@yoomee.com", "password")

      assert_equal "16e07c0846fff4c6e51f0e8797f960b5d383df1b1ae1522ccbbe4a0debf9ac2c", token[:access_token]
      assert_equal "f6538b64f1790364ec95220265a0af02da14fbbe6fd94f633b68c161e4f34efd", token[:refresh_token]
    end
  end

  def test_it_gets_latest_users
    VCR.use_cassette('latest_users') do
      client = Nellie::Client.new(access_token: 'access_token', refresh_token: 'refresh_token')
      client.store[:access_token] = client.access_token
      response = client.latest_users
      refute response.nil?
      refute response.users.nil?
      assert response.users.count == 12
    end
  end

  def test_it_gets_private_activity
    VCR.use_cassette('users_private_activity') do
      client = Nellie::Client.new(access_token: '589ac236525f4e378fcbccef1c4576df6d6273c74bc1a34ff357934c8d9f04b8', refresh_token: 'refresh_token')
      client.store[:access_token] = client.access_token
      response = client.private_activity(3)
      refute response.nil?
      refute response.posts.nil?
      assert response.posts.count == 2
    end
  end

end
