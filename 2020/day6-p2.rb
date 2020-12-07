puts File.read("#{__FILE__.split('-').first}.txt").split("\n\n").map { |row| row.split("\n").map(&:chars) }.map { |x| x.reduce(:&) }.map(&:count).reduce(:+)
