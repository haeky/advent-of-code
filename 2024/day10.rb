grid = ARGF.readlines.each_with_index.each_with_object({}) do |(line, y), hash|
  line.chomp.chars.each_with_index do |value, x|
    hash[[x, y]] = value != "." ? value.to_i : "."
  end
end

DIRECTIONS = [
  [1, 0],
  [0, 1],
  [-1, 0],
  [0, -1],
]

def walk(grid, current, visited, unique = true)
  return 0 if unique && visited.include?(current)

  visited << current
  return 1 if grid[current] == 9

  DIRECTIONS.sum do |d|
    point = current.zip(d).map(&:sum)
    next 0 unless grid[point] == grid[current] + 1

    walk(grid, point, visited, unique)
  end
end

part1, part2 = [true, false].map do |unique|
  grid.select { |_, v| v == 0 }.sum do |start, _|
    walk(grid, start, Set.new, unique)
  end
end

puts "Part 1: #{part1}"
puts "Part 2: #{part2}"
