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

result = File.read("#{__FILE__.split('-').first}.txt").gsub("\n", "").split("").each_with_object([[0, 0]]) do |direction, houses|
  houses << new_house(*houses.last, direction)
end.uniq.size

p result
