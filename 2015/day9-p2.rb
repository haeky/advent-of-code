distances = File.read("#{__FILE__.split('-').first}.txt").each_line.each_with_object({}) do |input, distances|
  a, _, b, _, distance = input.split(' ')
  distances[[a, b]] = distance.to_i
  distances[[b, a]] = distance.to_i
end

towns = distances.keys.flatten.uniq
paths = towns.permutation.each_with_object(Hash.new { |h, k| h[k] = 0 }) do |path, paths|
  0.upto(towns.size - 2) do |i|
    paths[path] += distances[[path[i], path[i + 1]]]
  end
end

p paths.sort_by(&:last).last
