points = File.read('day6.txt').each_line.map { |line| line.strip.split(', ').map(&:to_i) }

max_x = points.map(&:first).max + 1
max_y = points.map(&:last).max + 1

map = Array.new(max_y) { Array.new(max_x) { '.' } }

def manhattan(a, b)
  (a[0]-b[0]).abs + (a[1]-b[1]).abs
end

def find_closest(points, x, y)
  distances = points.each_with_index.each_with_object({}) do |(point, index), hash|
    hash[index] = manhattan([x, y], point)
  end

  top = Hash[distances.sort_by { |_, v| v }.first(2)]

  top.values.uniq.size > 1 ? top.first[0] : '.'
end

max_y.times do |y|
  max_x.times do |x|
    map[y][x] = find_closest(points, x, y)
  end
end

infinite_zones = [map.values_at(0, -1) + map.transpose.values_at(0, -1)].flatten.uniq

zones = (0..points.size-1).to_a - infinite_zones

result = zones.map do |zone, hash|
  map.flatten.count(zone)
end.max

puts result
