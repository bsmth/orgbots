require 'test/unit'
require_relative '../lib/config'
require_relative '../lib/tasks/tasks'

class TestTasks < Test::Unit::TestCase
  def test_basic_task
    tm = TaskManager.new
    assert_nothing_raised do
      tm.shuffle_rand_file
    end
  end
end
