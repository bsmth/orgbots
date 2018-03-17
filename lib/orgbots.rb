require_relative 'orgbots/version'
require_relative 'committer'
require 'octokit'
require 'dotenv/load'

Dotenv.load('orgbot.env')

branch = 'master'
file = 'README.md'
content = 'COOLPIPES'
message = 'DIRECT TO MASTER!'

Orgbot.new(ENV['REPO'], branch, ENV['OCTOKIT_TOKEN']).commit(file, content, message)
