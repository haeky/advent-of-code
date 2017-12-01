lines = File.read("#{__FILE__.split('-').first}.txt").each_line
result = lines.each_with_object(Array.new(1000) { Array.new(1000) { false } }) do |line, lights|
  instruction, starting, ending = line.scan(/(toggle|turn on|turn off)\s(\d*,\d*)\sthrough\s(\d*,\d*)/).first
  x1, y1 = starting.split(",").map(&:to_i)
  x2, y2 = ending.split(",").map(&:to_i)

  (x1..x2).each do |x|
    (y1..y2).each do |y|
      lights[x][y] = case instruction
      when "turn on"
        true
      when "turn off"
        false
      when "toggle"
        !lights[x][y]
      end
    end
  end
end

p result.flatten.count(true)
