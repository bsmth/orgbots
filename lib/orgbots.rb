require_relative 'orgbots/version'
require_relative 'utils/utils'
require_relative 'tasks/tasks'
require 'octokit'
require 'dotenv/load'
require 'base64'

# puts FileBot.new(r, t).list_files("master").inspect

# randombranch = BranchBot.new(r,t).list_branches.sample
# puts Octokit.contents(r).inspect
# CommitBot.new(r, nubranch, t).commit('nuwestfile.md', 'SWAGGing', 'creating swag')
