input = File.read("#{__FILE__.split('-').first}.txt").split("\n")

LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a

results = input.each_slice(3).map do |group|

  item, * = group.map(&:chars).inject(:&)
  LETTERS.index(item) + 1
end

puts results.sum
