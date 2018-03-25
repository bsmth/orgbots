require 'octokit'

# Some utilities
class Util
  def randemoji(number)
    number.times { ":#{Octokit.emojis.to_a.sample[0]}:" }
  end

  def ratelimit
    # Check if rate limited, if so, show time remaining
    reset_time = Octokit.rate_limit['resets_in']
    puts "Rate Limit resets in #{reset_time} seonds"
  end
end
