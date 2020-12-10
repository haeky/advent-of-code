adapters = File.read("#{__FILE__.split('-').first}.txt").split("\n").map(&:to_i).sort
adapters << adapters.last + 3

paths = Hash.new { 0 }
paths[0] = 1

[0, *adapters].each do |adapter|
  (1..3).each do |diff|
    if adapters.include?(adapter + diff)
      paths[adapter+diff] += paths[adapter]
    end
  end
end

puts paths[adapters.last]
