require_relative 'queries'
require 'octokit'

Dotenv.load('orgbot.env')

# Simple Console Reporting or usage instructions
class Reporter
  def initialize
    @prompt = TTY::Prompt.new
    @c = Octokit::Client.new(access_token: @t)
    @r = ENV['REPO']
    @t = ENV['TOKEN']
  end

  def welcome
    puts @c.say("Sup #{Query.new.user}")
    puts "\n🤖  Welcome to GitHub Simulator!"\
         'Select how and when you would like to commit to GitHub:'
  end

  def configs
    puts 'Place configs in orgbot.env in the format:'\
         'OCTOKIT_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'\
         'REPO=someuseraccount/coolrepo'
  end
end
