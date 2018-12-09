input = File.read('day8.txt')

tree = input.split.map(&:to_i)

def get_metadata(tree)
  child, metadata = tree.shift(2)

  child.times.map { get_metadata(tree) }.flatten + tree.shift(metadata)
end

puts get_metadata(tree).reduce(:+)
