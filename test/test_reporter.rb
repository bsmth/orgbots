require 'test/unit'
require_relative 'suppress_output'
require_relative '../lib/utils/reporter'

class TestReporter < Test::Unit::TestCase
  def test_welcome
    rep = Reporter.new
    assert_nothing_raised do
       suppress_output { rep.welcome }
    end
  end
end
