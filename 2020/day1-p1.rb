input = File.read("#{__FILE__.split('-').first}.txt").split("\n").map(&:to_i)

puts input.combination(2).find { |x, y| x + y == 2020 }.reduce(:*)
