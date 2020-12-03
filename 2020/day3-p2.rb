input = File.read("#{__FILE__.split('-').first}.txt").split("\n").map(&:chars)

def count_trees(forest, step_x, step_y)
  max_y = forest.size - 1
  max_x = forest.first.size

  x = 0

  (0 .. max_y).step(step_y).map do |y|
    value = forest[y][x % max_x]
    x += step_x

    value == '#'
  end.count(true)
end

slopes = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2],
]

puts slopes.map { |x, y| count_trees(input, x, y) }.reduce(&:*)
