lines = File.read('day2.txt').each_line.map(&:chomp)

lines.combination(2).each do |x, y|
  differences = x.each_char.each_with_index.count { |letter, index| y[index] != letter }

  next if differences > 1

  puts x
  puts y
end
