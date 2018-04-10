require_relative 'orgbots/version'
require_relative 'utils/utils'
require_relative 'tasks/tasks'
require_relative 'tasks/schedule'
require_relative 'config'

puts %(Welcome to GitHub Simulator!
Select how and when you would like to commit to GitHub:

)

Config.new.mode_config

# puts Util.new.ratelimit

# puts FileBot.new(r, t).list_files("master").inspect

# randombranch = BranchBot.new(r,t).list_branches.sample
# puts Octokit.contents(r).inspect
# CommitBot.new(r, nubranch, t).commit('nuwestfile.md', 'SWAGGing', 'creating swag')
