input = File.read("#{__FILE__.split('-').first}.txt").split("\n").map(&:to_i)

PREAMBLE = 25

invalid = input.drop(PREAMBLE).find.with_index(PREAMBLE) do |value, index|
  input[index-PREAMBLE..index-1].permutation(2).none? { |x, y| x+y == value }
end

(2..input.size).each do |i|
  input[0..input.index(invalid)-1].each_cons(i) do |values|
    if values.sum == invalid
      puts values.minmax.sum
      return
    end
  end
end
