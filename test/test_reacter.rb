require 'test/unit'
require_relative '../lib/config'
require_relative '../lib/utils/reacter'

class TestReacter < Test::Unit::TestCase
  def test_react
    rep = ReactBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      rep.randemoji(5)
    end
  end
end
