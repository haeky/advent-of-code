input = ARGF.readlines.map(&:chomp)

antennas = input.each_with_index.each_with_object(Hash.new { |h, k| h[k] = [] }) do |(line, y), hash|
  line.chomp.chars.each_with_index do |char, x|
    next if char == "."
    hash[char] << [x, y]
  end
end

result = antennas.each_with_object(Set.new) do |(antenna, coordinates), nodes|
  coordinates.permutation(2).each do |a, b|
    node = a.zip(b).map { |x, y| x - (y - x) }
    nodes << node if node.all? { |v| v.between?(0, input.size - 1) }
  end
end

puts "Part 1: #{result.size}"

result = antennas.each_with_object(Set.new) do |(antenna, coordinates), nodes|
  coordinates.permutation(2).each do |a, b|
    (0..).each do |i|
      node = a.zip(b).map { |x, y| x - (i * (y - x)) }
      break unless node.all? { |v| v.between?(0, input.size - 1) }
      nodes << node
    end
  end
end

puts "Part 2: #{result.size}"
