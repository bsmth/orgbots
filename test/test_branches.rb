require 'test/unit'
require 'dotenv/load'
require_relative '../lib/utils/brancher'

Dotenv.load('orgbot.env')

class TestBranches < Test::Unit::TestCase
  def test_create_delete_branch
    brancher = BranchBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      brancher.create_branch('cooltestbranch', 'master')
      sleep 10
      brancher.delete_branch('cooltestbranch')
    end
  end

  def test_list_branches
    brancher = BranchBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      puts brancher.list_branches
    end
  end

  def test_rand_branch
    brancher = BranchBot.new(ENV['REPO'], ENV['TOKEN'])
    assert_nothing_raised do
      puts brancher.rand_branch
    end
  end
end
