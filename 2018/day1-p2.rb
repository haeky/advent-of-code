frequency = 0

changes = File.read("day1.txt").each_line.map(&:chomp).map(&:to_i)

changes.cycle.each_with_object([0]) do |change, frequencies|
  frequency += change

  if frequencies.include?(frequency)
    puts frequency
    exit
  end

  frequencies << frequency
end
