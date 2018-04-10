require 'tty-prompt'

# Initialization config for setting up scheduling
# this requires user input vua tty-prompt gem
class Config
  def initialize
    @prompt = TTY::Prompt.new
  end

  def mode_select
    @mode = @prompt.select('Simulator Mode:') do |menu|
      menu.choice  'Simulate Mon-Fri Schedule'
      menu.choice  'Commit on selected days'
      menu.choice  'Randomly 24/7'
      menu.choice  'Commit Once now'
    end
    @mode
  end

  def mode_config
    @result = case mode
              when 'Simulate Mon-Fri Schedule' then 'Mon-Fri'
              when 'Commit on selected days only' then 'selected'
              when 'Randomly 24/7' then 'random'
              when 'Commit Once now' then 'test'
              else 'Unknown'
              end
    @input_date = Time.parse(prompt.ask('Enter a date:'))
  end
end
