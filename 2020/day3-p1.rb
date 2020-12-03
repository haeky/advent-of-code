input = File.read("#{__FILE__.split('-').first}.txt").split("\n").map(&:chars)

step_x = 3

max_y = input.size - 1
max_x = input.first.size

x = 0

results = (0 .. max_y).map do |y|
  value = input[y][x % max_x]
  x += step_x

  value == '#'
end

puts results.count(true)
