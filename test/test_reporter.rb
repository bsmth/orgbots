require 'test/unit'
require_relative '../lib/utils/reporter'

class TestReporter < Test::Unit::TestCase
    def test_welcome
      rep = Reporter.new
      assert_nothing_raised do
        rep.welcome
      end
    end
end
