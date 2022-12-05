input = File.read("#{__FILE__.split('-').first}.txt")

stacks, moves = input.split(/[ 0-9]+\n\n/)
stacks = stacks.split("\n").map do |row, array|
  row.chars.each_slice(4).map(&:join).map(&:strip)
end
stacks = stacks.transpose.map(&:reverse).map { |stack| stack.reject(&:empty?) }

moves.split("\n").each do |move|
  amount, from, to = move.match(/move (\d+) from (\d+) to (\d+)/).captures.map(&:to_i)
  stacks[to - 1] += stacks[from - 1].pop(amount)
end

p stacks.map(&:last).join.tr("[]", "")
