require_relative 'utils/utils'
require 'tty-prompt'
require 'dotenv/load'

Dotenv.load('orgbot.env')

# Initialization config for setting up scheduling
# this requires user input vua tty-prompt gem
class Config
  def initialize
    @prompt = TTY::Prompt.new
    @r = ENV['REPO']
    @t = ENV['TOKEN']
  end

  def validate_token
    if @t.length == 40 && /[a-z0-9]/.match(@t)
      puts "✅  Access Token valid for #{Query.new.user}\n"
    else
      puts "❌   Invalid GitHub Token\n\n" \
           'Generate an access token at https://github.com/settings/tokens/new'
      Reporter.new.configs
      exit
    end
  end

  # rubocop:disable Performance/RedundantMatch:
  def validate_repo
    if %r{\w+\/\w+}.match(@r)
      puts "✅  Configured for commits in https://www.github.com/#{@r}\n\n"
    else
      puts "❌   Invalid Repo \n\n" +
      Reporter.new.configs
      exit
    end
  end
  # rubocop:enable Performance/RedundantMatch:

  def checklist
    validate_token
    validate_repo
    puts 'Check the above GitHub Credentials point'\
         'to the correct user and repo before proceeding.'
    Prompter.new.confirm
  end

  def mode_select
    @mode = @prompt.select('Simulator Mode:') do |menu|
      menu.default 4

      menu.choice name: 'Simulate Mon-Fri Schedule', value: 1, disabled: '(coming soon)'
      menu.choice name: 'Commit on selected days', value: 2, disabled: '(coming soon)'
      menu.choice name: 'Randomly 24/7', value: 3, disabled: '(coming soon)'
      menu.choice name: 'Commit Once now', value: 4
    end
    @mode
  end

  def mode_config
    @result = case mode_select
              when 1 then 'Mon-Fri' # select date to begin and end
              when 2 then 'selected' # unclear
              when 3 then 'random' # select begin and enf date
              when 4 then RandCommit.new(@r, @t).commit
              end
    # @input_date = ask_date
    @result
  end
end
