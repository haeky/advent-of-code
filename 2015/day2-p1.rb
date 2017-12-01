result = File.read("#{__FILE__.split('-').first}.txt").each_line.inject(0) do |total, line|
  length, width, height = line.split('x').map(&:to_i).sort
  total += 2 * (length * width) + 2 * (length * height) + 2 * (width * height) + (length * width)
end

p result
