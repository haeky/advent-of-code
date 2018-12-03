puts File.read("day1.txt").each_line.map(&:chomp).map(&:to_i).reduce(:+)
