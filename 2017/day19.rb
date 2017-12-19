maze = File.read('day19.txt').chomp.split("\n").map(&:chars)

directions = %i(down left up right)

x = maze.first.index('|')
y = 0
direction = :down

1.step.each_with_object([]) do |i, letters|
  value = maze[y][x]

  case value
  when /[A-Z]/
    letters << value
  when '+'
    opposite_direction = directions.rotate(directions.index(direction))[2]
    (directions - [opposite_direction]).each do |d|
      case d
      when :down
        direction = d if y + 1 < maze.size and !maze[y+1][x].strip.empty?
      when :up
        direction = d if y - 1 >= 0 and !maze[y-1][x].strip.empty?
      when :right
        direction = d if x + 1 < maze.first.size and !maze[y][x+1].strip.empty?
      when :left
        direction = d if y - 1 >= 0 and !maze[y][x-1].strip.empty?
      end
    end
  when ' '
    puts letters.join
    puts i - 1
    exit
  end

  case direction
  when :down
    y += 1
  when :up
    y -= 1
  when :right
    x += 1
  when :left
    x -= 1
  end
end
