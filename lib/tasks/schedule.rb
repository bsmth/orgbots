# require 'rufus-scheduler'

# scheduler = Rufus::Scheduler.new

# def think
#   puts "#{Time.now} Thinking..."
#   # puts sleep(rand * 10)
#   # puts "#{Time.now} I had a thought."
# end

# def time_rand(from, to)
#   Time.at(from + rand * (to.to_f - from.to_f))
# end

# @ftimes = []

# 5.times do
#   time = time_rand Time.local(2018, 4, 9, 0o0, 9), Time.local(2018, 4, 9, 0o0, 10)
#   ftime = time.strftime('%y/%m/%d %H:%M:%S')
#   @ftimes.push(ftime)
#   scheduler.at ftime do
#     think
#   end
# end

# @ftimes.sort!
# puts 'Scheduling at:'
# puts @ftimes

# scheduler.join
