input = ARGF.readlines.each_with_object({}).with_index do |(line, hash), y|
  line.chomp.chars.each_with_index  do |char, x|
    hash[[x, y]] = char
  end
end

def traverse(grid)
  visited = {}
  directions = [
    [0, -1],
    [1, 0],
    [0, 1],
    [-1, 0],
  ].cycle

  guard = grid.key("^")
  direction = directions.next

  while(true)
    x, y = guard.zip(direction).map(&:sum)

    if ["#", "O"].include?(grid[[x, y]])
      direction = directions.next
    elsif grid[[x, y]].nil?
      return grid
    else
      grid[[x, y]] = "X"

      history = [[x, y], direction]
      if visited[history]
        return nil
      else
        visited[history] = true
      end

      guard = [x, y]
    end
  end

  grid
end

result = traverse(input.dup)

puts "Part 1: #{result.count { |_, v| v == "X" }}"

result = input.map do |k, _|
  grid = input.dup
  grid[k] = "O" unless grid[k] == "^"

  traverse(grid)
end

puts "Part 2: #{result.count(nil)}"
