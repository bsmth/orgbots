require 'test/unit'
require_relative '../lib/config'
require_relative '../lib/tasks/tasks'

class TestRandCommit < Test::Unit::TestCase
  def test_pick_file
    rc = RandCommit.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      rc.pick_file('master')
    end
  end

  def test_gen_filename
    rc = RandCommit.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      rc.gen_file
    end
  end

  def test_commit_to_random_branch
    rc = RandCommit.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      rc.commit_rand_branch
    end
  end

  def test_gen_word_maybe
    rc = RandCommit.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      rc.genword
      rc.maybe
    end
  end

  def test_txt_code_ext
    rc = RandCommit.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      rc.txt_ext
      rc.code_ext
    end
  end
end
