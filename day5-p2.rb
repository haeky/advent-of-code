total = 0
File.read("#{__FILE__.split('-').first}.txt").each_line do |line|
  total += 1 if line.scan(/(..).*\1+/).size > 0 and line.scan(/(.).\1/).size > 0
end
p total
