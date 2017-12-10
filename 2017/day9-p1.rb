input = if ARGV[0]
  ARGV[0]
else
  File.read('day9.txt')
end

level = 0
score = 0

input.gsub(/!./, '').gsub(/<.*?>/, '').gsub(/[^{}]/, '').chars.each do |c|
  level += if c == '{'
    +1
  else
    score += level
    -1
  end
end

puts score
