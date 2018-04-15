require 'test/unit'
require 'dotenv/load'
require_relative '../lib/utils/pullrequest'

Dotenv.load('orgbot.env')

class TestPullRequest < Test::Unit::TestCase
  def test_open_prs
    pr = PRBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      pr.open_prs
    end
  end

  def test_all_pr_comments
    pr = PRBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      pr.all_pr_comments
    end
  end
end
