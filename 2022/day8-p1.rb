forest = File.readlines("day8.txt").each_with_object([]) do |line, array|
  array << line.chomp.chars.map(&:to_i)
end.reverse

result = (1..forest.size-2).each_with_object([]) do |y, trees|
  (1..forest.size-2).each do |x|
    tree = forest[y][x]

    paths = [
      forest[y][0..x-1],
      forest[y][x+1..-1],
      forest.transpose[x][0..y-1],
      forest.transpose[x][y+1..-1],
    ].map do |path|
      path.all? { |height| height < tree }
    end

    trees << tree if paths.any?
  end
end

puts result.count + (forest.size*4)-4
