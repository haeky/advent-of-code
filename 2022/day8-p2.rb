forest = File.readlines("day8.txt").each_with_object([]) do |line, array|
  array << line.chomp.chars.map(&:to_i)
end.reverse

result = (1..forest.size-2).each_with_object([]) do |y, trees|
  (1..forest.size-2).each do |x|
    tree = forest[y][x]

    scores = [
      forest[y][0..x-1].reverse,
      forest[y][x+1..-1],
      forest.transpose[x][0..y-1].reverse,
      forest.transpose[x][y+1..-1],
    ].map do |path|
      index = path.find_index { |height| height >= tree }
      index ? index + 1 : path.size
    end

    trees << scores.inject(:*)
  end
end

puts result.max
