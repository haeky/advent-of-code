inputs = File.read('day2.txt').split("\n").map { |r| r.gsub(/\s+/, ' ').split(' ').map(&:to_i) }

result = inputs.map do |row|
  row.minmax.inject(:-).abs
end.inject(:+)

puts result
