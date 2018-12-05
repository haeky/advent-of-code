require 'date'

lines = File.read('day4.txt').each_line.map(&:chomp)

guards = Hash.new { |h, k| h[k] = Hash.new(0) }

current_guard = nil
started_sleeping = nil

lines.sort.each do |line|
  date, record = *line.match(/\[(?<date>.*)\] (?<record>.*)/).captures

  date = DateTime.parse(date)

  case record
  when /Guard #(\d+) begins shift/
    current_guard = $1.to_i
  when /falls asleep/
    started_sleeping = date
  when /wakes up/
    (started_sleeping.minute .. date.minute - 1).each do |minute|
      guards[current_guard][minute] += 1
    end
  end
end

guards.each do |id, clock|
  minute, _ = *clock.max_by { |_, v| v }
  total = clock.values.reduce(:+)

  puts "Guard ##{id} slept for #{total} and minute ##{minute} was the most sleepy"
end
