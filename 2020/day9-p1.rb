input = File.read("#{__FILE__.split('-').first}.txt").split("\n").map(&:to_i)

PREAMBLE = 25

result = input.drop(PREAMBLE).select.with_index(PREAMBLE) do |value, index|
  input[index-PREAMBLE..index-1].permutation(2).none? { |x, y| x+y == value }
end

puts result
