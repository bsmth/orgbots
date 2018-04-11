require_relative 'orgbots/version'
require_relative 'utils/utils'
require_relative 'tasks/tasks'
require_relative 'tasks/schedule'
require_relative 'config'

# Run through the setup checklist before proceeding
Config.new.checklist

# GO!
system 'clear'
puts Octokit.say("Sup #{Query.new.user}")
puts %(\n🤖  Welcome to GitHub Simulator!
Select how and when you would like to commit to GitHub:

)

# Prompt the user to select which mode to run Orgbots in
Config.new.mode_config
