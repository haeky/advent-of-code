input = File.read("#{__FILE__.split('-').first}.txt").strip.chars.map(&:to_i)

puts input.zip(input.rotate(input.length/2)).to_a.select { |a, b| a == b }.map(&:first).inject(:+)
