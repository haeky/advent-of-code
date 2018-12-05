fabric = Array.new(1000) { Array.new(1000) { [] } }
lines = File.read('day3.txt').each_line.map(&:chomp)

lines.each do |line|
  id, x, y, width, length = *line.match(/#(?<id>\d+) @ (?<x>\d+),(?<y>\d+): (?<width>\d+)x(?<height>\d+)/).captures.map(&:to_i)

  (y .. y + length - 1).each do |row|
    (x .. x + width - 1).each do |col|
      fabric[col][row] << id
    end
  end
end

ids = fabric.each_with_object([]) do |row, ids|
  row.each do |col|
    ids.push(*col) if col.size > 1
  end
end

puts (1..lines.size).to_a - ids
