inputs = File.read("#{__FILE__.split('-').first}.txt").each_line

distances = inputs.each_with_object(Hash.new { |h, k| h[k] = {} }) do |input, distances|
  a, effect, units, b = input.match(/(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+)./).values_at(1, 2, 3, 4)
  operator = effect == 'gain' ? 1 : -1
  distances[a][b] =  operator * units.to_i
end

permutations = distances.keys.permutation.each_with_object(Hash.new { |h, k| h[k] = 0 }) do |p, permutations|
  (p << p[0]).each_cons(2) do |a, b|
    permutations[p] += distances[a][b] + distances[b][a]
  end
end

p permutations.sort_by(&:last).last
