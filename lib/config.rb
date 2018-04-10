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

  def ask_date
    Time.parse(@prompt.ask('Enter a date:'))
  end
end
