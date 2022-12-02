input = File.read("#{__FILE__.split('-').first}.txt").split("\n").map { |round| round.split(" ") }

RESULTS = 3.times.flat_map { |i| [3, 6, 0].rotate(-i) }
MOVES = [1, 2, 3] * 3
COMBINATIONS = ["A", "B", "C"].product(["X", "Y", "Z"])
POINTS = Hash[COMBINATIONS.zip(MOVES.zip(RESULTS))]

scores = input.map do |round|
  POINTS[round].sum
end

puts scores.sum
