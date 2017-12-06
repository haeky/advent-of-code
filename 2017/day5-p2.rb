require 'pry'
inputs = if ARGV[0]
  ARGV[0].split(' ').map(&:to_i)
else
  File.read('day5.txt').split("\n").map(&:to_i)
end

position = 0
index = 0

while true
  index += 1
  previous_position = position
  position = inputs[position] + previous_position

  if inputs[position].nil?
    puts index
    exit;
  end

  increment = inputs[previous_position] >= 3 ? -1 : 1

  inputs[previous_position] = inputs[previous_position] + increment
end
