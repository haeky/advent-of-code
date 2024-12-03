input = ARGF.read

puts "Part 1: #{input.scan(/mul\((\d+),(\d+)\)/).map { |x, y| x.to_i * y.to_i }.sum}"
puts "Part 2: #{input.scan(/mul\((\d+),(\d+)\)|(do)\(\)|(don't)\(\)/).filter_map { |x, y, on, off| x.to_i * y.to_i unless off..on }.sum}"
