require_relative '../utils/utils'
require_relative 'random_commit'
require 'octokit'

Dotenv.load('orgbot.env')
r = ENV['REPO']
t = ENV['TOKEN']

RandCommitter.new(r, t).commit('swagging')
