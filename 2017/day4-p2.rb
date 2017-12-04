inputs = if ARGV[0]
  [ARGV[0]]
else
  File.read('day4.txt').split("\n")
end

result = inputs.map do |row|
  words = row.split(' ')
  words.uniq.size == words.size && words.none? { |word| (word.chars.permutation(word.size).to_a.map(&:join) - [word]).any? { |p| words.include?(p) }}
end.count(true)

puts result
