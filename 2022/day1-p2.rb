input = File.read("#{__FILE__.split('-').first}.txt").split("\n\n").map { |calories| calories.split("\n").map(&:to_i) }

puts input.map(&:sum).max(3).sum
