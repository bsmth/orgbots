require 'test/unit'
require 'dotenv/load'
require_relative '../lib/utils/issues'

Dotenv.load('orgbot.env')

class TestIssues < Test::Unit::TestCase
  def test_list_issues
    issue = IssueBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      issue.list_issues
    end
  end

  def test_list_open_issues
    issue = IssueBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      issue.open_issues
    end
  end

  def test_list_closed_issues
    issue = IssueBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      issue.closed_issues
    end
  end
end
