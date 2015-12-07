def new_house(x, y, direction)
  case direction
  when ">"
    [x + 1, y]
  when "<"
    [x - 1, y]
  when "^"
    [x, y + 1]
  when "v"
    [x, y - 1]
  end
end

santa_houses = [[0, 0]]
robot_houses = [[0, 0]]

File.read("#{__FILE__.split('-').first}.txt").gsub("\n", "").split("").each_with_index do |direction, index|
  if index.even?
    santa_houses << new_house(*santa_houses.last, direction)
  else
    robot_houses << new_house(*robot_houses.last, direction)
  end
end

p (santa_houses + robot_houses).uniq.size
