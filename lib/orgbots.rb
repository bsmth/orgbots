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

# BranchBot.new(r, t).create_branch('awesome_branch', 'master')
# CommitBot.new(r, 'awesome_branch', t).commit('README.md', 'SWAGGSALOT', 'fix typo')
PRBot.new(r, t).open_pr('master', 'awesome_branch', 'URGENT PR', 'PLZ MARGE IT ASAP')
