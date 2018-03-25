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

puts Util.new.ratelimit

# Dotenv.load('orgbot.env')
# r = ENV['REPO']

# @c = Octokit::Client.new(access_token: t)

# BranchBot.new(r, t).create_branch('cool2', 'cool')
# CommitBot.new(r, 'awesome_branch', t).commit('README.md', 'SWAGGSALOT', 'fix typo')
# PRBot.new(r, t).open_pr('master', 'cool2', 'URGENT PR', "PLZ MARGE IT ASAP\n* 1\n* 2")

# pr = 4
# sha = PRBot.new(r, t).get_pr_commits(pr)[0][:sha]
# file = BlobBot.new(r, t).get_tree(sha)

# puts "you should probably comment on #{file.path} with #{file.size} size"
# puts file.inspect

# blob_sha = file[:sha]
# puts "blob_sha = #{blob_sha}"

# file_blob = @c.blob(r, blob_sha)
# puts "file_blob = #{file_blob.inspect}"

# puts Base64.decode64(file_blob.content)

# PRBot.new(r, t).create_pr_comment(pr, "wow, seriously?", sha, file, position)

# puts Util.new.randemoji(4)
