require_relative 'orgbots/version'
require_relative 'pullrequest'
require_relative 'committer'
require_relative 'brancher'
require_relative 'issues'
require 'octokit'
require 'dotenv/load'

Dotenv.load('orgbot.env')
r = ENV['REPO']
t = ENV['OCTOKIT_TOKEN']

# BranchBot.new(r, t).create_branch('cool2', 'cool')
# CommitBot.new(r, 'awesome_branch', t).commit('README.md', 'SWAGGSALOT', 'fix typo')
# PRBot.new(r, t).open_pr('master', 'cool2', 'URGENT PR', "PLZ MARGE IT ASAP\n* 1\n* 2")
# puts PRBot.new(r, t).open_prs
