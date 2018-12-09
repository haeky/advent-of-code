input = File.read('day8.txt')

tree = input.split.map(&:to_i)

def get_value(tree)
  child, metadata = tree.shift(2)

  if child.zero?
    tree.shift(metadata).reduce(:+)
  else
    scores = child.times.map { get_value(tree) }

    tree.shift(metadata).map do |i|
      scores[i-1]
    end.compact.reduce(:+)
  end
end

puts get_value(tree)
