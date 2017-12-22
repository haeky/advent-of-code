particles = File.read('day20.txt').each_line.map { |line| line.scan(/(-?\d+)/).flatten.map(&:to_i).each_slice(3).to_a }

1000.times do
  particles = particles.group_by(&:first).select { |_, v| v.size == 1 }.map { |_, v| v.first }
  particles.each do |p, v, a|
    3.times do |i|
      p[i] += v[i] += a[i]
    end
  end
end

puts particles.size
