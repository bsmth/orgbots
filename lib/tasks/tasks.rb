require_relative '../utils/utils'
require_relative 'random_commit'
require_relative 'schedule'
require 'octokit'

Dotenv.load('orgbot.env')

# Some tasks
class TaskManager
  def initialize
    @c = Octokit::Client.new(access_token: ENV['TOKEN'])
    @r = ENV['REPO']
    @t = ENV['TOKEN']
  end

  def shuffle_rand_file
    @message = 'shufflin'
    @branch = BranchBot.new(@r, @t).list_branches.sample
    @file = FileBot.new(@r, @t).list_files(@branch).collect { |f| f[:path] }.sample
    @content = FileBot.new(@r, @t).get_contents(@file, @branch)[:content]
    RandCommit.new(@r, @t).shuffle_file(@branch, @file, @content, @message)
  end
end
