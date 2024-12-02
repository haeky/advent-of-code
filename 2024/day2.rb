input = ARGF.readlines.map { |line| line.split.map(&:to_i) }

def safe?(report)
  ranges = report
    .each_cons(2)
    .to_a
    .map { |x, y| x - y }
  ranges.all? { |r| r.between?(1, 3) } || ranges.all? { |r| r.between?(-3, -1) }
end

def safeish?(report)
  return true if safe?(report)

  report.combination(report.size - 1).any? do |combination|
    safe?(combination)
  end
end

puts "Part 1: #{input.map { |r| safe?(r) }.count(true)}"
puts "Part 1: #{input.map { |r| safeish?(r) }.count(true)}"

