inputs = File.read('day2.txt').split("\n").map { |r| r.gsub(/\s+/, ' ').split(' ').map(&:to_i) }

result = inputs.map do |row|
  row.permutation(2).select { |a, b| a % b == 0 }.flatten.inject(:/)
end.inject(:+)

puts result
