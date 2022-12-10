input = File.read("day10.txt").split("\n")

signal = [1]

input.each do |line|
  value = line[/(-?[\d]+)/]

  signal << signal.last
  signal << signal.last + value.to_i unless value.nil?
end

# Part 1
results = [20, 60, 100, 140, 180, 220].map do |cycle|
  cycle * signal[cycle - 1]
end

p results.sum

# Part 2
signal.each_slice(40) do |line|
  result = line.map.with_index do |x, index|
    [index-1, index, index+1].include?(x) ? "#" : "."
  end.join

  puts result
end
