require 'octokit'

# Some utilities
class Util
  def randemoji(multiple)
    moji = Octokit.emojis.to_a.sample(multiple)
    str = ''
    moji.each { |a| str += ":#{a[0]}: " }
    str
  end

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
