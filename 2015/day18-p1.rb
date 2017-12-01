SIZE = 100
STEPS = 100

inputs = File.read("#{__FILE__.split('-').first}.txt").each_line

def turn_on?(y, x, lights)
  total = ([x-1, x, x+1].product([y-1, y, y+1]) - [[x, y]]).inject(0) do |total, (a, b)|
    next total unless [b, a].all? { |p| p.between?(0, SIZE-1) }

    total += 1 if lights[b][a] == "#"
    total
  end

  if lights[y][x] == "#"
    total.between?(2, 3)
  else
    total == 3
  end
end

lights = inputs.map do |line|
  line.split('')
end

(0..STEPS-1).each do |step|
  lights = (0..SIZE-1).to_a.map do |y|
    (0..SIZE-1).to_a.map do |x|
      turn_on?(y, x, lights) ? "#" : "."
    end
  end
end

p lights.flatten.count { |x| x == "#" }
