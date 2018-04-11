require 'octokit'
require 'dotenv/load'

Dotenv.load('orgbot.env')

# Simple Queries
class Query
  def initialize
    @prompt = TTY::Prompt.new
    @r = ENV['REPO']
    @t = ENV['TOKEN']
  end

  def user
    @c = Octokit::Client.new(access_token: @t)
    @c.user[:login]
  end
end
