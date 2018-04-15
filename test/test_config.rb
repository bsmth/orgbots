require 'test/unit'
require_relative '../lib/config'

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

  # requires user input, look into IO pipe here
  # to simulate gets
  #
  # def test_mode_select
  #   conf = Config.new
  #   assert_nothing_raised do
  #     conf.mode_select
  #   end
  # end
  #
  # def test_mode_select
  #   conf = Config.new
  #   assert_nothing_raised do
  #     conf.mode_config
  #   end
  # end
  #
  # def test_mode_select
  #   conf = Config.new
  #   assert_nothing_raised do
  #     conf.checklist
  #   end
  # end
end
