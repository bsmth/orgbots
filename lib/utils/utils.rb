require_relative 'pullrequest'
require_relative 'committer'
require_relative 'brancher'
require_relative 'issues'
require_relative 'files'
require_relative 'reacter'
require_relative 'queries'
require_relative 'prompts'
require_relative 'reporter'
require 'octokit'

# Some basic utilities
class Util
  def ratelimit
    rem = Octokit.rate_limit['remaining']
    total = seconds_to_str(Octokit.rate_limit['resets_in'].to_i)
    puts "#{rem} remaining requests, Rate Limit resets in #{total}"
  end

  def seconds_to_str(seconds)
    ["#{seconds / 3600}h", "#{seconds / 60 % 60}m", "#{seconds % 60}s"]
      .select { |str| str =~ /[1-9]/ }.join(' ')
  end
end
