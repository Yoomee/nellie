require './test/test_helper'

class NellieUserTest < Minitest::Test

  def test_exists
    assert Nellie::User
  end

  def test_it_logs_in_the_user
    VCR.use_cassette('user_token') do
      token = Nellie::User.login("user@example.com", "super_secret")

      assert_equal "ff380d4ba9daff7ec35fb63df75772951ed1a18e245a1b1929446f99e40db2e7", token.token
      assert_equal "2cdfd2fe688204d3ea7af9075047a6774f258b54221039ca685952f1d1021462", token.refresh_token
      assert_equal 7200, token.expires_in
    end
  end

end