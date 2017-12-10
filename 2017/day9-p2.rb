input = if ARGV[0]
  ARGV[0]
else
  File.read('day9.txt')
end

score = 0

input.gsub(/!./, '').gsub(/<.*?>/).each do |garbage|
  score += garbage.length - 2
end

puts score
