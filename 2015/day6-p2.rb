lines = File.read("#{__FILE__.split('-').first}.txt").each_line
result = lines.each_with_object(Array.new(1000) { Array.new(1000) { 0 } }) do |line, lights|
  instruction, starting, ending = line.scan(/(toggle|turn on|turn off)\s(\d*,\d*)\sthrough\s(\d*,\d*)/).first
  x1, y1 = starting.split(",").map(&:to_i)
  x2, y2 = ending.split(",").map(&:to_i)

  (x1..x2).each do |x|
    (y1..y2).each do |y|
      lights[x][y] = case instruction
      when "turn on"
        lights[x][y] + 1
      when "turn off"
        lights[x][y] > 0 ? lights[x][y] - 1 : 0
      when "toggle"
        lights[x][y] + 2
      end
    end
  end
end

p result.flatten.inject { |total, x| total + x }
