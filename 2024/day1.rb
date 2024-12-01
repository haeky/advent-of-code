input = ARGF.read.split.map(&:to_i).each_slice(2).to_a.transpose

left, right = input.map(&:sort)

puts "Part 1: #{left.zip(right).map { |x, y| (x - y).abs }.sum}"

left, right = input

puts "Part 2: #{left.map { |x| x * right.count(x) }.sum}"
