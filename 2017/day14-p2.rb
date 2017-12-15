input = 'ugkiagan'

grid = {}

class Point
  attr_accessor :x, :y, :value, :visited

  def initialize(x, y, value)
    @x = x
    @y = y
    @value = value
  end

  def visit(grid)
    return if visited

    @visited = true
    return if value.zero?

    neighbors(grid).each do |neighbor|
      neighbor.visit(grid)
    end
  end

  def neighbors(grid)
    [grid[[x,y-1]], grid[[x,y+1]], grid[[x-1,y]], grid[[x+1, y]]].compact
  end
end

128.times do |y|
  `ruby day10-p2.rb #{input}-#{y}`.chomp.to_i(16).to_s(2).rjust(128, '0').chars.each_with_index do |value, x|
    grid[[x, y]] = Point.new(x, y, value.to_i)
  end
end

group = 0

128.times do |y|
  128.times do |x|
    point = grid[[x, y]]

    if !point.visited and point.value == 1
      group += 1
    end

    point.visit(grid)
  end
end

puts group
