input = File.read("#{__FILE__.split('-').first}.txt").split("\n").map { |round| round.split(" ") }

RESULTS = [0, 3, 6] * 3
MOVES = 3.times.flat_map { |i| [3, 1, 2].rotate(i) }
COMBINATIONS = ["A", "B", "C"].product(["X", "Y", "Z"])
POINTS = Hash[COMBINATIONS.zip(MOVES.zip(RESULTS))]

scores = input.map do |round|
  POINTS[round].sum
end

puts scores.sum
