require 'test/unit'
require_relative '../lib/config'
require_relative '../lib/tasks/tasks'

class TestConfig < Test::Unit::TestCase
  def test_repo
    conf = Config.new
    assert_nothing_raised do
      conf.validate_repo
    end
  end

  def test_token
    conf = Config.new
    assert_nothing_raised do
      conf.validate_token
    end
  end

  def test_checklist
    conf = Config.new
    assert_nothing_raised do
      conf.checklist
    end
  end

  # def test_mode_select
  #   conf = Config.new
  #   assert_nothing_raised do
  #     conf.mode_select
  #   end
  # end

  # def test_mode_config
  #   conf = Config.new
  #   assert_nothing_raised do
  #     conf.mode_config
  #   end
  # end
end
