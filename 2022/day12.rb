input = File.read("day12.txt").split("\n")

class Node
  attr_accessor :value, :distance, :visited

  def initialize(value)
    @value = value
    @distance = 0
    @visited = false
  end

  def reset
    @distance = 0
    @visited = false
  end

  def finish?
    value == "E"
  end

  def visited?
    visited
  end

  def walkable?(other)
    [other, self].map do |n|
      n.value.gsub("S", "a").gsub("E", "z").ord
    end.reduce(:-) <= 1
  end
end

grid = input.each_with_object({}).with_index do |(line, hash), y|
  line.chomp.chars.each_with_index do |char, x|
    hash[[x, y]] = Node.new(char)
  end
end

DIRECTIONS = [
  [1, 0],
  [-1, 0],
  [0, 1],
  [0, -1],
]

def find_path(grid, start:)
  starts = grid.select { |k, v| v.value == start }

  starts.each_with_object([]) do |(start, _), distances|
    grid.values.each(&:reset)
    queue = [start]

    while !queue.empty?
      coordinate = queue.shift
      node = grid[coordinate]

      if node.finish?
        distances << node.distance
        break
      end

      DIRECTIONS.each do |direction|
        neighbor_coordinate = coordinate.zip(direction).map(&:sum)

        next unless neighbor = grid[neighbor_coordinate]
        next if neighbor.visited?
        next unless node.walkable?(neighbor)

        neighbor.visited = true
        neighbor.distance = node.distance + 1

        queue << neighbor_coordinate
      end
    end
  end
end

puts find_path(grid, start: "S").min
puts find_path(grid, start: "a").min
