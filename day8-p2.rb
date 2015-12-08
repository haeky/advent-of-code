result = File.read("#{__FILE__.split('-').first}.txt").each_line.inject(0) do |total, line|
  total += (line.chomp.inspect.size - line.chomp.size)
end

p result
