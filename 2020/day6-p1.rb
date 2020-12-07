puts File.read("day6.txt").split("\n\n").map { |row| row.gsub("\n", '').chars.uniq.count }.reduce(&:+)
