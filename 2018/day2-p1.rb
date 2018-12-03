lines = File.read('day2.txt').each_line.map(&:chomp)

two, three = 0

lines.each do |line|
  occurences = Hash[line.each_char.group_by(&:itself).map {|k,v| [k, v.size] }]

  two += 1 unless occurences.select { |k, count| count == 2 }.empty?
  three += 1 unless occurences.select { |k, count| count == 3 }.empty?
end

puts two * three
