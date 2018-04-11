require 'test/unit'
require 'dotenv'

class TestDotenv < Test::Unit::TestCase
  def setup
    Dotenv.load('orgbot.env')
    @t = ENV['TOKEN']
    @r = ENV['REPO']
  end

  def test_token
    assert_not_nil(@t)
  end

  def test_repo
    assert_not_nil(@r)
  end
end
