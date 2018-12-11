points = File.read('day10.txt').each_line.map do |line|
  line.match(/position=<(.*),(.*)> velocity=<(.*),(.*)>/).captures.map(&:to_i)
end

def tick(second, points)
  points.map do |point|
    x, y, v_x, v_y = *point

    [x + second * v_x, y + second * v_y]
  end
end

def print_sky(stars)
  (0..250).map do |y|
    puts (0..250).map { |x| stars.include?([x, y]) ? '#' : '.' }.join
  end
end

500_000.times do |second|
  stars = tick(second, points)

  if stars.map(&:last).minmax.reverse.reduce(:-) < 20
    puts "Currently on #{second}"
    print_sky(stars)
  end
end
