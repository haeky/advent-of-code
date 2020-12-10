input = [0, *File.read("#{__FILE__.split('-').first}.txt").split("\n").map(&:to_i).sort]

result = input.each_cons(2).map { |x, y| y - x }.group_by { |x| x }.map { |k, v| [k, v.length] }.to_h

puts result[1] * (result[3] + 1)
