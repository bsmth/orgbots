require 'octokit'

# Simple Console Reporting or usage instructions
class Reporter
  def configs
    puts "\nPlace configs in orgbot.env in the format:"
    puts 'OCTOKIT_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    puts 'REPO=someuseraccount/coolrepo'
  end
end
