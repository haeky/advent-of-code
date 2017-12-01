result = File.read("#{__FILE__.split('-').first}.txt").to_s.gsub("\n", "").split("").inject(0) do |floor, char|
  floor = floor.send(char == "(" ? :+ : :-, 1)
end

p result
