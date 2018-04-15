require 'test/unit'
require_relative '../lib/utils/utils'

class TestUtils < Test::Unit::TestCase
    def test_ratelimit
      util = Util.new
      assert_nothing_raised do
        util.ratelimit
      end
    end

    def test_time_conversion
      util = Util.new
      expected = "50m 2s"
      assert_equal(expected, util.seconds_to_str(3002))
    end
end
