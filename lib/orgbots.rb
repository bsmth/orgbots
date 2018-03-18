require_relative 'orgbots/version'
require_relative 'committer'
require_relative 'brancher'
require_relative 'issues'
require 'octokit'
require 'dotenv/load'

Dotenv.load('orgbot.env')
r = ENV['REPO']
t = ENV['OCTOKIT_TOKEN']

# branch = 'coolbranch'
# file = 'README.md'
# content = 'COOLPIPES'
# message = 'DIRECT TO MASTER!'

# Examples to create/delete branches:
# BranchBot.new(r, branch, t).create_branch
# BranchBot.new(r, branch, t).delete_branch

# Example to commit to a file:
# CommitBot.new(r, branch, t).commit(file, content, message)

# Example to query issues in a given repository:
# IssueBot.new(r, t).create_issue('Swag','Some cool issue')
IssueBot.new(r, t).list_issues
# IssueBot.new(r, t).close_issue(2)
