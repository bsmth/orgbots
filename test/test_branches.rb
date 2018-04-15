require 'test/unit'
require 'dotenv/load'
require_relative '../lib/utils/brancher'

Dotenv.load('orgbot.env')

class TestBranches < Test::Unit::TestCase
  def test_list_branches
    brancher = BranchBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      brancher.list_branches
    end
  end
end
