require_relative 'orgbots/version'
require_relative 'utils/utils'
require_relative 'tasks/tasks'
require_relative 'tasks/schedule'
require 'octokit'
require 'dotenv/load'
require 'base64'

puts "\nWelcome to GitHub Simulator! Please select an option:\n"

def prompt_date
  puts %(
1\) Randomly
2\) Simulate Mon-Fri Workdays
3\) Commit many times on a selected day
4\) Commit Once now
  )
  STDOUT.flush
  gets.chomp.to_i
end

def prompt_times
  puts 'How many commits would you like to schedule'
  STDOUT.flush
  gets.chomp.to_i
end

def prompt_init
  puts 'Please select between 1 and 4' until prompt_date.between?(1, 4)
  prompt_times
end

puts "Scheduling #{prompt_init} times"

# puts Util.new.ratelimit

# puts FileBot.new(r, t).list_files("master").inspect

# randombranch = BranchBot.new(r,t).list_branches.sample
# puts Octokit.contents(r).inspect
# CommitBot.new(r, nubranch, t).commit('nuwestfile.md', 'SWAGGing', 'creating swag')
