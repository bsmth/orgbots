require_relative '../utils/utils'
require_relative 'random_commit'
require_relative 'diff'
require 'octokit'

Dotenv.load('orgbot.env')
r = ENV['REPO']
t = ENV['TOKEN']

# RandCommitter.new(r, t).commit
# puts Differ.new(r, t).hooks
# CommitBot.new(r, b, t).commit(file, content, message)

message = 'shufflin'
branch = BranchBot.new(r, t).list_branches.sample
file = FileBot.new(r, t).list_files(branch).collect { |f| f[:path] }.sample
content = FileBot.new(r, t).get_contents(file, branch)[:content]

RandCommitter.new(r, t).shuffle_file(branch, file, content, message)
