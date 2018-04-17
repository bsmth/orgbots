require_relative 'orgbots/version'
require_relative 'utils/utils'
require_relative 'tasks/tasks'
require_relative 'config'

# Run through the setup checklist before proceeding
Config.new.checklist
Prompter.new.confirm

# # Clear the screen and show a welcome message
# system 'clear'
# Reporter.new.welcome

# # Prompt the user to select which mode to run Orgbots in
# Config.new.mode_config
