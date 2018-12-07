points = File.read('day6.txt').each_line.map { |line| line.strip.split(', ').map(&:to_i) }

max_x = points.map(&:first).max + 1
max_y = points.map(&:last).max + 1

map = Array.new(max_y) { Array.new(max_x) { '.' } }

def manhattan(a, b)
  (a[0]-b[0]).abs + (a[1]-b[1]).abs
end

def total_distance(points, x, y)
  points.each_with_index.each_with_object({}) do |(point, index), hash|
    hash[index] = manhattan([x, y], point)
  end.values.reduce(:+)
end

max_y.times do |y|
  max_x.times do |x|
    map[y][x] = total_distance(points, x, y) >= 10_000 ? '.' : '#'
  end
end

puts map.flatten.count('#')
