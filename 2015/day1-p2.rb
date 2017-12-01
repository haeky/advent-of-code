File.read("#{__FILE__.split('-').first}.txt").to_s.gsub("\n", "").split("").each_with_index.inject(0) do |floor, (char, index)|
  floor = floor.send(char == "(" ? :+ : :-, 1)
  if floor == -1
    p index + 1
    exit
  end
  floor
end
