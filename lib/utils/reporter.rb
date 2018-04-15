require_relative 'queries'
require 'octokit'

# Simple Console Reporting or usage instructions
class Reporter
  def welcome
    puts Octokit.say("Sup #{Query.new.user}")
    puts "\n🤖  Welcome to GitHub Simulator!"\
         'Select how and when you would like to commit to GitHub:'
  end

  def configs
    puts 'Place configs in orgbot.env in the format:'\
         'OCTOKIT_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'\
         'REPO=someuseraccount/coolrepo'
  end
end
