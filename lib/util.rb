require 'octokit'

# Some utilities
class Util
  def randemoji(number)
    number.times { ":#{Octokit.emojis.to_a.sample[0]}:" }
  end

  def ratelimit
    rem = Octokit.rate_limit['remaining']
    puts "#{rem} remaining requests"
    total = seconds_to_str(Octokit.rate_limit['resets_in'].to_i)
    puts "Rate Limit resets in #{total}" if rem.zero?
  end

  def seconds_to_str(seconds)
    ["#{seconds / 3600}h", "#{seconds / 60 % 60}m", "#{seconds % 60}s"]
      .select { |str| str =~ /[1-9]/ }.join(' ')
  end
end
