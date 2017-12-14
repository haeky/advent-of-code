input = File.read('day13.txt').chomp

total = 0
input.each_line do |line|
  level, depth = line.chomp.split(': ').map(&:to_i)
  total += level * depth if level % ((depth - 1) * 2) == 0
end

puts total
