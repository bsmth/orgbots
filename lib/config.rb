require_relative 'utils/utils'
require 'tty-prompt'
require 'dotenv/load'
require 'tty-spinner'
require 'pastel'

Dotenv.load('orgbot.env')

# Initialization config for setting up scheduling
# this requires user input vua tty-prompt gem
class Config
  def initialize
    @pastel = Pastel.new
    @prompt = TTY::Prompt.new
    @c = Octokit::Client.new(access_token: @t)
    @r = ENV['REPO']
    @t = ENV['TOKEN']
    format = "[#{@pastel.yellow(':spinner')}] " + @pastel.yellow('Validating...')
    @spinner = TTY::Spinner.new(format, success_mark: @pastel.green('+'))
  end

  def success(message)
    @spinner.success(@pastel.green(message))
  end

  def validate_token
    @spinner.auto_spin
    if @t.length == 40 && /[a-z0-9]/.match(@t)
      user = Query.new.user
      success("✅  Access Token valid for #{user}\n")
    else
      @spinner.error("❌   Invalid GitHub Token\n\n" \
           'Generate an access token at https://github.com/settings/tokens/new')
      Reporter.new.configs
      exit
    end
  end

  def validate_repo
    @spinner.auto_spin
    @c.repo(@r)
    success("✅  Configured for commits in https://www.github.com/#{@r}\n\n")
  rescue StandardError => e
    if e.message.include? '404 - Not Found'
      @spinner.error("❌   Invalid Repo \n\n")
      Reporter.new.configs
      exit
    end
  end

  def checklist
    validate_token
    validate_repo
    puts 'Check the above GitHub Credentials point '\
         'to the correct user and repo before proceeding.'
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
              when 1 then 'Mon-Fri' # select date to begin?
              when 2 then 'selected' # unclear
              when 3 then 'random' # select date to begin
              when 4 then RandCommit.new(@r, @t).commit
              end
    # @input_date = ask_date
    @result
  end
end
