require 'octokit'
require 'dotenv/load'
require 'base64'
require_relative 'orgbots/version'
require_relative 'pullrequest'
require_relative 'committer'
require_relative 'brancher'
require_relative 'issues'
require_relative 'files'
require_relative 'reacter'
require_relative 'util'

Dotenv.load('orgbot.env')
r = ENV['REPO']
t = ENV['TOKEN']

nubranch = 'anothercoolbranch'

BranchBot.new(r, t).create_branch(nubranch, 'master')

CommitBot.new(r, nubranch, t).commit('nuwestfile.md', 'SWAGGing', 'creating swag')

PRBot.new(r, t).create_pr('master', nubranch, 'Another PR', "PLZ MARGE IT ASAP\n* 1\n* 2")
