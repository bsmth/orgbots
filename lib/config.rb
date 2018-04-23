require_relative 'utils/utils'
require_relative 'tasks/tasks'
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
      menu.default 1

      # rubocop:disable Metrics/LineLength
      menu.choice name: 'Commit Once now', value: 1
      menu.choice name: 'Schedule a single 9-5 workday of commits', value: 2
      menu.choice name: 'Simulate a 9to5, Mon-Fri Work Week', value: 3, disabled: '(coming soon)'
      menu.choice name: 'Randomly commit 24/7 until an end date', value: 4, disabled: '(coming soon)'
      # rubocop:enable Metrics/LineLength
    end
    @mode
  end

  def mode_config
    @result = case mode_select
              when 1 then RandCommit.new(@r, @t).commit_rand_branch
              when 2 then Schedule.new.sched_single_day
              when 3 then puts 'do a thing'
              when 4 then puts 'do a thing'
              end
    # @input_date = ask_date
    @result
  end
end
