require 'tty-prompt'
require 'octokit'

# Simple User Prompts
class Prompter
  def initialize
    @prompt = TTY::Prompt.new
  end

  def confirm
    exit unless @prompt.yes?('Ready to rock, Y/N?')
  end

  def ask_date
    Time.parse(@prompt.ask('Enter a date:'))
  end
end
