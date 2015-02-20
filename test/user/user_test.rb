require './test/test_helper'

class NellieUserTest < Minitest::Test

  def test_exists
    assert Nellie::Client::Users
  end

  def test_it_logs_in_the_user
    VCR.use_cassette('user_token') do
      token = Nellie::Client.login("greg@yoomee.com", "olive123")

      assert_equal "16e07c0846fff4c6e51f0e8797f960b5d383df1b1ae1522ccbbe4a0debf9ac2c", token[:access_token]
      assert_equal "f6538b64f1790364ec95220265a0af02da14fbbe6fd94f633b68c161e4f34efd", token[:refresh_token]
    end
  end

end