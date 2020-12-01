input = File.read("#{__FILE__.split('-').first}.txt").split("\n").map(&:to_i)

puts input.combination(3).find { |x, y, z| x + y + z == 2020 }.reduce(:*)
