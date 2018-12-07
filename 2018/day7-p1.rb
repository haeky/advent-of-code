matches = File.readlines('day7.txt').map do |line|
  line.match(/Step (?<start>[A-Z]) must be finished before step (?<end>[A-Z]) can begin./).captures
end

$RESULT = ''

def unlocked?(matches, node)
  return false if $RESULT.include?(node)

  (matches.select { |_, v| v == node }.map(&:first) - $RESULT.chars).empty?
end

def traverse(matches, node)
  $RESULT << node if unlocked?(matches, node)

  next_node = ('A'..'Z').to_a.select { |x| unlocked?(matches, x) }.first

  traverse(matches, next_node) unless next_node.nil?
end

traverse(matches, (('A'..'Z').to_a - matches.map(&:last)).first)

puts $RESULT
