require_relative 'utils'
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

  def ratelimit
    rem = Octokit.rate_limit['remaining']
    total = Util.new.seconds_to_str(Octokit.rate_limit['resets_in'].to_i)
    puts "#{rem} remaining requests, Rate Limit resets in #{total}"
  end
end
