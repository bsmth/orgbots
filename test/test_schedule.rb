require 'test/unit'
require_relative '../lib/tasks/schedule'

class TestSchedule < Test::Unit::TestCase
  def test_time_rand
    sch = Schedule.new
    assert_nothing_raised do
      sch.time_rand(Time.now, Time.now + 10_000)
    end
  end

  def test_single_9to5_day
    @ftimes = []
    assert_nothing_raised do
      Schedule.new.single_9to5_day(Time.now)
    end
  end
end
