grid_size = 999

input = File.read('day22.txt').each_line.map { |line| line.chomp.chars }
grid = Array.new(grid_size) { Array.new(grid_size, '.') }

directions = %i(left up right down)

z = (grid.size/2) - (input.size/2)

input.each_with_index do |y, i|
  y.each_with_index do |_, j|
    grid[z + i][z + j] = input[i][j]
  end
end

x = (grid.size/2)
y = (grid.size/2)

direction = :up
burst = 0

10_000_000.times do
  case grid[y][x]
  when '.'
    direction = directions.rotate(directions.index(direction) - 1)[0]
    grid[y][x] = 'W'
  when 'W'
    grid[y][x] = '#'
    burst += 1
  when '#'
    direction = directions.rotate(directions.index(direction) - 1)[2]
    grid[y][x] = 'F'
  when 'F'
    direction = directions.rotate(directions.index(direction) - 1)[3]
    grid[y][x] = '.'
  end

  case direction
  when :left
    x -= 1
  when :up
    y -= 1
  when :right
    x += 1
  when :down
    y += 1
  end
end

puts burst
