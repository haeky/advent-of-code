result = File.read("#{__FILE__.split('-').first}.txt").each_line.inject(0) do |total, line|
  length, width, height = line.split('x').map(&:to_i).sort
  total += (length + length + width + width) + (length * width * height)
end

p result
