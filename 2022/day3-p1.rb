input = File.read("#{__FILE__.split('-').first}.txt").split("\n")

LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a

results = input.map do |row|
  first, second = row.chars.each_slice(row.size / 2).to_a

  item, * = (first & second)
  LETTERS.index(item) + 1
end

puts results.sum
