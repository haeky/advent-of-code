grid = ARGF.readlines.each_with_object({}).with_index do |(line, hash), y|
  line.chomp.chars.each_with_index  do |char, x|
    hash[[x, y]] = char
  end
end

def traverse(grid, x, y)
  return [] unless grid[[x, y]] == "X"

  directions = [
    [[0, 0], [1, 0], [2, 0], [3, 0]],
    [[0, 0], [-1, 0], [-2, 0], [-3, 0]],
    [[0, 0], [0, 1], [0, 2], [0, 3]],
    [[0, 0], [0, -1], [0, -2], [0, -3]],
    [[0, 0], [1, 1], [2, 2], [3, 3]],
    [[0, 0], [-1, -1], [-2, -2], [-3, -3]],
    [[0, 0], [1, -1], [2, -2], [3, -3]],
    [[0, 0], [-1, 1], [-2, 2], [-3, 3]],
  ]

  directions.map do |direction|
    direction.map do |dx, dy|
      grid[[x + dx, y + dy]]
    end.join
  end
end

def traverse2(grid, x, y)
  return [] unless grid[[x, y]] == "A"

  directions = [
    [[-1, -1], [0, 0], [1, 1]],
    [[1, -1], [0, 0], [-1, 1]],
  ]

  result = directions.map do |direction|
    direction.map do |dx, dy|
      grid[[x + dx, y + dy]]
    end.join
  end
end

result = grid.map do |(x, y), _|
  traverse(grid, x, y)
end

puts "Part 1: #{result.flatten.count { |word| word == "XMAS" }}"

result = grid.map do |(x, y), _|
  traverse2(grid, x, y)
end

puts "Part 2: #{result.reject(&:empty?).filter { |x| x.all? { |w| w == "MAS" || w == "SAM" }}.count}"
