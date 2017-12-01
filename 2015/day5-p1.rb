total = 0
File.read("#{__FILE__.split('-').first}.txt").each_line do |line|
  next if ["ab", "cd", "pq", "xy"].any? { |s| line.include?(s) }

  total += 1 if line.scan(/[aeoui]/).size >= 3 and line.scan(/(.)\1+/).size >= 1
end
p total
