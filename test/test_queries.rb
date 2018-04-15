require 'test/unit'
require_relative '../lib/utils/queries'

class TestConfig < Test::Unit::TestCase
  def test_user_login
    query = Query.new
    assert_nothing_raised do
      query.user
    end
  end

  def test_ratelimit
    query = Query.new
    assert_nothing_raised do
      query.ratelimit
    end
  end
end
