fabric = Hash.new(0)

File.read('day3.txt').each_line do |line|
  _, x, y, width, length = *line.match(/#(?<id>\d+) @ (?<x>\d+),(?<y>\d+): (?<width>\d+)x(?<height>\d+)/).captures.map(&:to_i)

  (y .. y + length - 1).each do |row|
    (x .. x + width - 1).each do |col|
      fabric[[col, row]] += 1
    end
  end

end

puts fabric.values.count { |x| x > 1 }
