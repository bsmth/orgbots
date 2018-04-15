require 'octokit'
require 'dotenv/load'
require_relative 'utils'

Dotenv.load('orgbot.env')

# Simple Queries
class Query
  def initialize
    @prompt = TTY::Prompt.new
    @c = Octokit::Client.new(access_token: @t)
    @r = ENV['REPO']
    @t = ENV['TOKEN']
  end

  def ratelimit(client = Octokit)
    rem = client.rate_limit['remaining']
    total = Util.new.seconds_to_str(client.rate_limit['resets_in'].to_i)
    puts "#{rem} remaining requests, Rate Limit resets in #{total}"
  end

  def authed_ratelimit
    ratelimit(@c)
  end

  def user
    @c = Octokit::Client.new(access_token: @t)
    @c.user[:login]
  end

  def hooks
    @c.hooks(@repo)
  end
end
