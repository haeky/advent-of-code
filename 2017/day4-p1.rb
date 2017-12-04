inputs = File.read('day4.txt').split("\n")

result = inputs.map do |row|
  words = row.split(' ')
  words.uniq.size == words.size
end.count(true)

puts result
