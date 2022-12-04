input = File.read("#{__FILE__.split('-').first}.txt").split("\n")

results = input.map do |pair|
  first, second = pair.split(",").map { |sections| x, y = sections.split("-"); (x .. y).to_a }

  (first & second).empty? ? 0 : 1
end

puts results.sum
