result = File.read("#{__FILE__.split('-').first}.txt").each_line.inject(0) do |total, line|
  total += (line.chomp.size - eval(line.chomp).size)
end

p result
