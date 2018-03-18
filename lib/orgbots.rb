require_relative 'orgbots/version'
require_relative 'committer'
require_relative 'brancher'
require 'octokit'
require 'dotenv/load'

Dotenv.load('orgbot.env')

branch = 'coolbranch'
# file = 'README.md'
# content = 'COOLPIPES'
# message = 'DIRECT TO MASTER!'

BranchBot.new(ENV['REPO'], branch, ENV['OCTOKIT_TOKEN']).create_branch
sleep 30
BranchBot.new(ENV['REPO'], branch, ENV['OCTOKIT_TOKEN']).delete_branch
# CommitBot.new(ENV['REPO'], branch, ENV['OCTOKIT_TOKEN']).commit(file, content, message)
