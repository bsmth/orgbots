require_relative '../utils/utils'
require_relative 'random_commit'
require_relative 'diff'
require 'octokit'

Dotenv.load('orgbot.env')

# Some tasks
class TaskManager
  def initialize
    @c = Octokit::Client.new(access_token: ENV['TOKEN'])
    @r = ENV['REPO']
    @t = ENV['TOKEN']
  end

  def rand_file_content
    @branch = BranchBot.new(@r, @t).list_branches.sample
    @file = FileBot.new(@r, @t).list_files(@branch).collect { |f| f[:path] }.sample
    FileBot.new(@r, @t).get_contents(@file, @branch)[:content]
  end

  # Find a branch, find a file on that branch
  def shuffle_file
    @message = 'shufflin'
    RandCommit.new(@r, @t).shuffle_file(@branch, @file, rand_file_content, @message)
  end
end
