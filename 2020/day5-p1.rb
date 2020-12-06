input = File.read("#{__FILE__.split('-').first}.txt").split("\n").map(&:chars)

def decode_boarding_pass(data)
  data.map { |c| ['B', 'R'].include?(c) ? '1' : '0' }.join.to_i(2)
end

results = input.map do |boarding_pass|
  decode_boarding_pass(boarding_pass.first(7)) * 8 + decode_boarding_pass(boarding_pass.last(3))
end

puts results.max
