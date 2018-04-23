require 'rufus-scheduler'
require_relative '../utils/prompts'
require_relative 'random_commit'

# A class to schedule the occurences of tasks
class Schedule
  def initialize
    @ftimes = []
    @scheduler = Rufus::Scheduler.new
  end

  def time_rand(from, to)
    Time.at(from + rand * (to.to_f - from.to_f))
  end

  def single_9to5_day(day)
    rand(16..30).times do
      @ftimes.push(Time.at((day + 28_000) + rand(1..36_000)))
    end
    @ftimes.sort!
    @ftimes.delete_if do |time|
      hour = time.strftime('%H')
      true if hour == '12'
    end
  end

  def mult_times(mutliple)
    start_time = Prompter.new.ask_start_date
    end_time = Prompter.new.ask_end_date
    mutliple.times do
      time = time_rand start_time, end_time
      @ftime = time.strftime('%y/%m/%d %H:%M:%S')
      @ftimes.push(@ftime)
    end
  end

  def sched_single_day
    single_9to5_day(Prompter.new.ask_date)
    puts "Scheduling to commit at: #{@ftimes}"
    Prompter.new.confirm
    @ftimes.each do |time|
      @scheduler.at time do
        RandCommit.new(@r, @t).commit_rand_branch
      end
    end
    @scheduler.join
  end
end
