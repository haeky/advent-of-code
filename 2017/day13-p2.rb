input = File.read('day13.txt').chomp

delay = 0

while true
  found = false
  input.each_line do |line|
    level, depth = line.chomp.split(': ').map(&:to_i)
    found = true; break if (level + delay) % ((depth - 1) * 2) == 0
  end

  break unless found

  delay += 2
end

puts delay
