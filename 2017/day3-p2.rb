DIRECTIONS = [:right, :up, :left, :down]

def get_tail(number)
  current_number = 1
  current_coordinate = [0, 0]

  current_direction = :right

  max_x = 0
  min_x = 0
  max_y = 0
  min_y = 0

  grid = {}
  while current_number < number
    grid[current_coordinate] = current_number

    current_coordinate = next_coordinate(current_direction, *current_coordinate)
    current_number = total_neighbor(grid, *current_coordinate)

    case current_direction
    when :right
      if current_coordinate.first == max_x + 1
        max_x = max_x.next
        current_direction = :up
      end
    when :up
      if current_coordinate.last == max_y + 1
        max_y = max_y.next
        current_direction = :left
      end
    when :left
      if current_coordinate.first == -(min_x + 1)
        min_x = min_x.next
        current_direction = :down
      end
    when :down
      if current_coordinate.last == -(min_y + 1)
        min_y = min_y.next
        current_direction = :right
      end
    end

  end

  current_number
end

def total_neighbor(grid, x, y)
  grid[[x + 1, y]].to_i +
    grid[[x + 1, y + 1]].to_i +
    grid[[x, y + 1]].to_i +
    grid[[x - 1, y + 1]].to_i +
    grid[[x - 1, y]].to_i +
    grid[[x - 1, y - 1]].to_i +
    grid[[x, y - 1]].to_i +
    grid[[x + 1, y - 1]].to_i
end

def next_coordinate(direction, x, y)
  case direction
  when :right
    [x + 1, y]
  when :up
    [x, y + 1]
  when :left
    [x - 1, y]
  when :down
    [x, y - 1]
  end
end

puts get_tail(ARGV[0].to_i)
