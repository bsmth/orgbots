require 'tty-prompt'
require 'octokit'

# Simple User Prompts
class Prompter
  def initialize
    @prompt = TTY::Prompt.new
  end

  def confirm
    exit unless @prompt.yes?('Ready to rock, Y/N?')
    system 'clear'
  end

  def ask_date
    Time.parse(@prompt.ask('Enter a date (Y/M/D):'))
  end

  def ask_start_date
    Time.parse(@prompt.ask('Enter a start date (Y/M/D):'))
  end

  def ask_end_date
    Time.parse(@prompt.ask('Enter an end date (Y/M/D):'))
  end
end
