require 'octokit'
require 'dotenv/load'
require 'base64'
require_relative 'util'
require_relative 'pullrequest'
require_relative 'committer'
require_relative 'brancher'
require_relative 'issues'
require_relative 'files'
require_relative 'reacter'

# Dotenv.load('orgbot.env')
# r = ENV['REPO']
# t = ENV['TOKEN']

# puts FileBot.new(r, t).list_files('master').inspect
# randombranch = BranchBot.new(r,t).list_branches.sample
# puts Octokit.contents(r).inspect

# CommitBot.new(r, nubranch, t).commit('nuwestfile.md', 'SWAGGing', 'creating swag')
